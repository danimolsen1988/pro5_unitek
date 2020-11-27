/*!
* @brief Component name:	tdm
*
* Time-division multiplexing for transmitting
*
* @file tdm.c
*/

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "tdm.h"
#include "FreeRTOS.h"
#include "task.h"
#include "deca_regs.h"
#include "port_platform.h"


//#define frequency 60 //make sure it is slow when we test
#define frequency 25 //make sure it is slow when we test 

#define ALL_MSG_COMMON_LEN 2
#define RX_BUF_LEN 31 //added 1 bytes for CMD
/* Indexes to access some of the fields in the frames defined above. */
#define ALL_MSG_SN_IDX 2
#define RESP_MSG_POLL_RX_TS_IDX 21
#define RESP_MSG_RESP_TX_TS_IDX 25
#define RESP_MSG_TS_LEN 4
#define RESP_MSG_SOURCE_ID_IDX 11
#define RESP_MSG_TARGET_ID_IDX 3
#define RESP_MSG_ID_LEN 8
#define RESP_MSG_CMD_LEN 1

#define RESP_MSG_CMD_IDX 20 //20 is CMD field...

/* UWB microsecond (uus) to device time unit (dtu, around 15.65 ps) conversion factor.
* 1 uus = 512 / 499.2 us and 1 us = 499.2 * 128 dtu. */
#define UUS_TO_DWT_TIME 65536

/* Speed of light in air, in metres per second. */
#define SPEED_OF_LIGHT 299702547

static tdmState nextState;
static tdmOrginaizer organizer;

/* Frames used in the ranging process. See NOTE 2,3 below. */
//                            1     2     3  4      5       6     7       8     9     10      11    12      13    14    15      16      17    18      19    20  21 22 23 24 25 26 27 28 29 30 31
static uint8 rx_resp_msg[] = {0x88, 0x37, 0, 0x00 , 0x00 , 0x00 , 0x00 , 0x00, 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0 , 0 ,0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
static uint8 tx_poll_msg[] = {0x88, 0x37, 0, 0x00 , 0x00 , 0x00 , 0x00 , 0x00, 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0 , 0 ,0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

/* Length of the common part of the message (up to and including the function code, see NOTE 1 below). */

/* Frame sequence number, incremented after each transmission. */
static uint8 frame_seq_nb = 0;

/* Buffer to store received response message.
* Its size is adjusted to longest frame that this example code is supposed to handle. */
static uint8 rx_buffer[RX_BUF_LEN];

/* Hold copy of status register state here for reference so that it can be examined at a debug breakpoint. */
static uint32 status_reg = 0;

/* broadcast target address */
static uint8 broadCastAddr[] = {0 , 0 , 0 , 0 , 0 , 0 , 0, 0};

extern xQueueHandle xQueue;
extern xQueueHandle xStatusQueue;


/**@brief tdm task entry function.
*
* @param[in] pvParameter   Pointer that will be used as the parameter for the task.
*/
void tdmTask (void * pvParameter){
  UNUSED_PARAMETER(pvParameter);

  initTdm(); // init it

  TickType_t xLastWakeTime;
  const TickType_t xFrequency = frequency; //find out the tickrate...
  xLastWakeTime = xTaskGetTickCount();
  // Initialise the xLastWakeTime variable with the current time.

  while (true){
    // Wait for the next cycle.
    /* Delay a task until */
    vTaskDelayUntil( &xLastWakeTime, xFrequency );
    // Perform action here.   
    //this is where i run my main code 
    /* Tasks must be implemented to never return... */
    stepState(nextState);
  }
}

static void initTdm(){
  nextState = DISCOVER;

  tdmSlot slotOne;
  slotOne.free = true;
  slotOne.timeoutCount = 0;

  tdmSlot slotTwo;
  slotTwo.free = true;
  slotTwo.timeoutCount = 0;

  tdmSlot slotThree;
  slotThree.free = true;
  slotThree.timeoutCount = 0;

  organizer.slotsFree = 3;
  organizer.slot1 = slotOne;
  organizer.slot2 = slotTwo;
  organizer.slot3 = slotThree;

  //SET source addr now, it never changes...
  uwbAddress uwb_id;
  dwt_geteui((uint8*) &uwb_id.addr);
  setMsgField(&tx_poll_msg[RESP_MSG_SOURCE_ID_IDX], uwb_id.addrArr,RESP_MSG_ID_LEN);
}

static void emptyTimeslot(tdmSlot * slot){
  slot->free = true;
  slot->timeoutCount = 0;
  slot->address.addr = 0;
  organizer.slotsFree = organizer.slotsFree + 1;
}


static void buildMessage(uint8 cmd, uint8 * target){
  //source should be set from beginning...
  tx_poll_msg[ALL_MSG_SN_IDX] = frame_seq_nb;
  //set cmd_field
  tx_poll_msg[RESP_MSG_CMD_IDX] = cmd;
  //set destination
  setMsgField(&tx_poll_msg[RESP_MSG_TARGET_ID_IDX],target,RESP_MSG_ID_LEN);
}


static bool sendAndReceive(uint8 * tx_msg, int length){
  bool success = false;
  /* Write frame data to DW1000 and prepare transmission. See NOTE 3 below. */
  dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
  dwt_writetxdata(length, tx_msg, 0); /* Zero offset in TX buffer. */
  dwt_writetxfctrl(length, 0, 1); /* Zero offset in TX buffer, ranging. */

  /* Start transmission, indicating that a response is expected so that reception is enabled automatically after the frame is sent and the delay
  * set by dwt_setrxaftertxdelay() has elapsed. */
  dwt_starttx(DWT_START_TX_IMMEDIATE | DWT_RESPONSE_EXPECTED);   
 

  

  /* We assume that the transmission is achieved correctly, poll for reception of a frame or error/timeout. See NOTE 4 below. */
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR)))
  {};

    #if 0  // include if required to help debug timeouts.
    int temp = 0;		
    if(status_reg & SYS_STATUS_RXFCG )
    temp =1;
    else if(status_reg & SYS_STATUS_ALL_RX_TO )
    temp =2;
    if(status_reg & SYS_STATUS_ALL_RX_ERR )
    temp =3;
    #endif

  /* Increment frame sequence number after transmission of the poll message (modulo 256). */
  frame_seq_nb++;

  if (status_reg & SYS_STATUS_RXFCG){		
    uint32 frame_len;    

    /* Clear good RX frame event in the DW1000 status register. */
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_RXFCG);

    /* A frame has been received, read it into the local buffer. */
    frame_len = dwt_read32bitreg(RX_FINFO_ID) & RX_FINFO_RXFLEN_MASK;
   
    if (frame_len == RX_BUF_LEN){
      dwt_readrxdata(rx_buffer, frame_len, 0);  
      /* As the sequence number field of the frame is not relevant, it is cleared to simplify the validation of the frame. */
      rx_buffer[ALL_MSG_SN_IDX] = 0;
    
      //compare framecontrol
      /* Check that the frame is the expected response from the companion "SS TWR responder" example.*/
      if (memcmp(rx_buffer, rx_resp_msg, ALL_MSG_COMMON_LEN) == 0){	
        success = true;
      }
    }
  }
  else{
    /* Clear RX error/timeout events in the DW1000 status register. */
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR);

    /* Reset RX to properly reinitialise LDE operation. */
    dwt_rxreset();
  }  
  return success;
}

static void doBroadCast(){
  //ONLY HANDLE BROADCASTS HERE
  //CHECK FOR EMPTY SLOTS!!    
  if(organizer.slotsFree < 3){
    //TÆND LED
    LEDS_ON(BSP_LED_1_MASK);
    
  }else{
    //SLUK
    LEDS_OFF(BSP_LED_1_MASK);
  }


  if(organizer.slotsFree == 0){
     return; //no empty slots - do nothing    
  }

  //create message - only need to set target addr to empty
  setMsgField(&tx_poll_msg[RESP_MSG_TARGET_ID_IDX],broadCastAddr,RESP_MSG_ID_LEN);
  tx_poll_msg[RESP_MSG_CMD_IDX] = NEW_TAG; //might need to typecast it to uint...

  if(sendAndReceive(tx_poll_msg,RX_BUF_LEN)){
    //get source address
    uwbAddress uwb_id;
    for(int i = 0; i < RESP_MSG_ID_LEN; i++){
      uwb_id.addrArr[i] = rx_buffer[RESP_MSG_SOURCE_ID_IDX+i];
    }

    tdmSlot * availableSlot;

    //VERIFY WE DO NOT HAVE IT - IDEALLY THIS SHOULD NOT HAPPEN..
    if(organizer.slot1.address.addr == uwb_id.addr){
      return;
    }else if(organizer.slot2.address.addr == uwb_id.addr){
      return;
    }else if(organizer.slot3.address.addr == uwb_id.addr){
      return;
    }

    //HAVING A POP PUSH STRUCTURE FOR GETTING AVAILBLE SLOTS??
    if(organizer.slot1.free){
      organizer.slot1.address = uwb_id;
      organizer.slot1.free = false;
      organizer.slot1.timeoutCount = 0;
      organizer.slot1.event = UPDATE_TAG;
      organizer.slotsFree = organizer.slotsFree - 1;
    }else if(organizer.slot2.free){
      organizer.slot2.address = uwb_id;
      organizer.slot2.free = false;
      organizer.slot2.timeoutCount = 0;
      organizer.slot2.event = UPDATE_TAG;
      organizer.slotsFree = organizer.slotsFree - 1;          
    }else if(organizer.slot3.free){
      organizer.slot3.address = uwb_id;
      organizer.slot3.free = false;
      organizer.slot3.timeoutCount = 0;
      organizer.slot3.event = UPDATE_TAG;
      organizer.slotsFree = organizer.slotsFree - 1;
    }else{
      //we had a problem somewhere a mismatch has happend
      //should reset structure          
    }
    //NOTIFY QUEUE EVENT NEW_TAG       
    createEventMsg(uwb_id,NEW_TAG, 0);
  }

}

static void updateTimeouts(tdmSlot * slot, int slotNum){
  slot->timeoutCount = slot->timeoutCount + 1;
  //check to see if uwb-tag should loose slot
  if(slot->timeoutCount >= 3){
    //remove it
    emptyTimeslot(slot);
    //we decided to remove tag, notify it
    //SEND NOTIFICATION REMOVE_TAG
    createEventMsg(slot->address,DELETE_TAG, slotNum);
  }
}


static void doTagTransmission(tdmSlot * slot,int slotNum){
  //ONLY HANDLE "TIMESLOT" HERE
  //"timeslot"
  if(slot->free){
    return; //nothing assigned to slot - do nothing
  }   
  //create message based on event
  
  //READ QUEUE HERE
  if(xStatusQueue != NULL){
    xMessage statusMsg;
    if(xQueueReceive(xStatusQueue,&(statusMsg),(TickType_t)0) ==pdPASS) {
      if(statusMsg.event==DELETE_TAG){
        //DO SOME LOOPING to check for id 
        setNewStatus(&statusMsg);
      }
    }
  }

  if(slot->event == DELETE_TAG){
    //delete
    buildMessage(DELETE_TAG,slot->address.addrArr);
    if(sendAndReceive(tx_poll_msg,RX_BUF_LEN)){
      slot->timeoutCount = 0; //just reset timeout since we has success
      emptyTimeslot(slot);
    }else{
      //error
      //transmission did not go well
      updateTimeouts(slot, slotNum);
    }
  }else{
    //assume its normal twr
    buildMessage(UPDATE_TAG,slot->address.addrArr);
    if(sendAndReceive(tx_poll_msg,RX_BUF_LEN)){
      slot->timeoutCount = 0; //just reset timeout since we has success
      createEventMsg(slot->address,slot->event, slotNum);
    }else{
      //error
      //transmission did not go well
      updateTimeouts(slot, slotNum);
    }
  }
}


/*EVENT SHIT NEEDS TO BE FIXED*/
static bool createEventMsg(uwbAddress address, event_type event, int slot){
  uint32 poll_tx_ts, resp_rx_ts, poll_rx_ts, resp_tx_ts;
  int32 rtd_init, rtd_resp;
  float clockOffsetRatio ;
  double tof;

  xMessage eventMessage;
  eventMessage.event = event; 
  eventMessage.id = address.addr;

  /* Retrieve poll transmission and response reception timestamps. See NOTE 5 below. */
  poll_tx_ts = dwt_readtxtimestamplo32();
  resp_rx_ts = dwt_readrxtimestamplo32();

  /* Read carrier integrator value and calculate clock offset ratio. See NOTE 7 below. */
  clockOffsetRatio = dwt_readcarrierintegrator() * (FREQ_OFFSET_MULTIPLIER * HERTZ_TO_PPM_MULTIPLIER_CHAN_5 / 1.0e6) ;

  /* Get timestamps embedded in response message. */
  msgGetTs(&rx_buffer[RESP_MSG_POLL_RX_TS_IDX], &poll_rx_ts);
  msgGetTs(&rx_buffer[RESP_MSG_RESP_TX_TS_IDX], &resp_tx_ts);

  /* Compute time of flight and distance, using clock offset ratio to correct for differing local and remote clock rates */
  rtd_init = resp_rx_ts - poll_tx_ts;
  rtd_resp = resp_tx_ts - poll_rx_ts;

  tof = ((rtd_init - rtd_resp * (1.0f - clockOffsetRatio)) / 2.0f) * DWT_TIME_UNITS; // Specifying 1.0f and 2.0f are floats to clear warning
  
  eventMessage.tof = tof;

/*
  //DELETE IF PROVES TOO SLOW
  if(event != UPDATE_TAG){
    printf("Event : %d # slot : %d \r\n",event,slot);
  }
  */
  
  if(xQueue != NULL){
    if(xQueueSend(xQueue,(void *)&eventMessage,0) == pdTRUE) {
      return true;
    }
  }  
  return false;
}



void stepState(){
  switch(nextState){
    case DISCOVER:
      //just do what is neeeded
      doBroadCast();
      nextState = SLOT_ONE;
      break;
    case  SLOT_ONE:
      doTagTransmission(&organizer.slot1,1);
      nextState = SLOT_TWO;
      break;
    case SLOT_TWO:
      doTagTransmission(&organizer.slot2,2);
      nextState = SLOT_THREE;
      break;
    case SLOT_THREE:
      doTagTransmission(&organizer.slot3,3);
      nextState = DISCOVER;
      break;
    default:
      //should never enter here
      break;
  }
}

static void msgGetTs(uint8 *ts_field, uint32 *ts){
  int i;
  *ts = 0;
  for (i = 0; i < RESP_MSG_TS_LEN; i++)
  {
    *ts += ts_field[i] << (i * 8);
  }
}

static void setNewStatus(xMessage * statusMsg){
  if(!organizer.slot1.free && organizer.slot1.address.addr == statusMsg->id){
    organizer.slot1.event = DELETE_TAG;
  }else if(!organizer.slot2.free && organizer.slot2.address.addr == statusMsg->id){
    organizer.slot2.event = DELETE_TAG;
  }else if(!organizer.slot3.free && organizer.slot3.address.addr == statusMsg->id){
    organizer.slot3.event = DELETE_TAG;
  }
}


/*
* @brief fill a msg field with data
*
* @param field pointer on the frist bye of the field to be filled
*        data value to be written
*        length data length
*
* @return none
*/
static void setMsgField(uint8 *field, uint8 * data, int length){
  for(int i = 0; i < length; i++){
    field[i] = data[i];
  }
}


/*****************************************************************************************************************************************************
* NOTES:
*
* 1. The frames used here are Decawave specific ranging frames, complying with the IEEE 802.15.4 standard data frame encoding. The frames are the
*    following:
*     - a poll message sent by the initiator to trigger the ranging exchange.
*     - a response message sent by the responder to complete the exchange and provide all information needed by the initiator to compute the
*       time-of-flight (distance) estimate.
*    The first 10 bytes of those frame are common and are composed of the following fields:
*     - byte 0/1: frame control (0x8841 to indicate a data frame using 16-bit addressing).
*     - byte 2: sequence number, incremented for each new frame.
*     - byte 3/4: PAN ID (0xDECA).
*     - byte 5/6: destination address, see NOTE 2 below.
*     - byte 7/8: source address, see NOTE 2 below.
*     - byte 9: function code (specific values to indicate which message it is in the ranging process).
*    The remaining bytes are specific to each message as follows:
*    Poll message:
*     - no more data
*    Response message:
*     - byte 10 -> 13: poll message reception timestamp.
*     - byte 14 -> 17: response message transmission timestamp.
*    All messages end with a 2-byte checksum automatically set by DW1000.
* 2. Source and destination addresses are hard coded constants in this example to keep it simple but for a real product every device should have a
*    unique ID. Here, 16-bit addressing is used to keep the messages as short as possible but, in an actual application, this should be done only
*    after an exchange of specific messages used to define those short addresses for each device participating to the ranging exchange.
* 3. dwt_writetxdata() takes the full size of the message as a parameter but only copies (size - 2) bytes as the check-sum at the end of the frame is
*    automatically appended by the DW1000. This means that our variable could be two bytes shorter without losing any data (but the sizeof would not
*    work anymore then as we would still have to indicate the full length of the frame to dwt_writetxdata()).
* 4. We use polled mode of operation here to keep the example as simple as possible but all status events can be used to generate interrupts. Please
*    refer to DW1000 User Manual for more details on "interrupts". It is also to be noted that STATUS register is 5 bytes long but, as the event we
*    use are all in the first bytes of the register, we can use the simple dwt_read32bitreg() API call to access it instead of reading the whole 5
*    bytes.
* 5. The high order byte of each 40-bit time-stamps is discarded here. This is acceptable as, on each device, those time-stamps are not separated by
*    more than 2**32 device time units (which is around 67 ms) which means that the calculation of the round-trip delays can be handled by a 32-bit
*    subtraction.
* 6. The user is referred to DecaRanging ARM application (distributed with EVK1000 product) for additional practical example of usage, and to the
*     DW1000 API Guide for more details on the DW1000 driver functions.
* 7. The use of the carrier integrator value to correct the TOF calculation, was added Feb 2017 for v1.3 of this example.  This significantly
*     improves the result of the SS-TWR where the remote responder unit's clock is a number of PPM offset from the local inmitiator unit's clock.
*     As stated in NOTE 2 a fixed offset in range will be seen unless the antenna delsy is calibratred and set correctly.
*
****************************************************************************************************************************************************/