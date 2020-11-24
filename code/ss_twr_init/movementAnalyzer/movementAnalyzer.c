/*!
* @brief Component name:	movementAnalzer
*
* the main application for movement analysis
* 
*
* @file movementAnalyzer.c
*/
#include "movementAnalyser.h"
#include <stdio.h>
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"
#include "deca_device_api.h"
#include "deca_regs.h"
#include "port_platform.h"
#include "../Calibration/calibration.h"
#include "../Ignorelist/ignorelist.h"
#include "../movementAnalysis/movementAnalysis.h"
#include "../movementstruct/movementStruct.h"
#include "../uart/uart_fifo.h"
#include "inttypes.h"

/* Declaration of static functions. */
static int tagOnList(tags * tag, uint64_t id);
static int updateTag(tags* tag, xMessage message);
static _Bool newTag(tags * tag,xMessage message);
static _Bool deleteTag(tags* tag, uint64_t id);
static uint32_t tagAnalysis(tags* tag);
static int movementAnalyzer(void);

//tag struct for keeping data on tags.
static tags tag[TAGLISTSIZE] = {0}; 
const tags default_tag;

//Queue for sending data between TDM-task and this task.
extern xQueueHandle xQueue;
extern xQueueHandle xStatusQueue;

// data far calibration
#if DEBUG_EVENT == 1
  static double distance[AVG];
  static int cal = 0;
  static int delay = 0;
  static uint64_t tag_id = 0;
  #define RNG_DELAY_MS 10
  //data for ignorelist debugging
#elif DEBUG_EVENT == 3
  #define RNG_DELAY_MS 500
  uint64_t tag_id;
  static uint64_t counter = 0;
  static double distance;
  static double tof;

#else /* DEBUG_EVENT */
  #if DEBUG_MOVEMENTSTATE == 1
    #define RNG_DELAY_MS 24
  #else
    #define RNG_DELAY_MS 100 // inter-ranging delay. should be cordinated with TDM-task
  #endif
  static double distance;
#endif
/*! ------------------------------------------------------------------------------------------------------------------


/**@brief   MovementAnalyzer Initiator task entry function.
*
* @param[in] pvParameter   Pointer that will be used as the parameter for the task.
*/
void movementAnalyzer_initiator (void * pvParameter) {
  UNUSED_PARAMETER(pvParameter);
  dwt_setleds(DWT_LEDS_DISABLE);

//  TickType_t xLastWakeTime;
 // const TickType_t xFrequency = RNG_DELAY_MS; //find out the tickrate...
  //xLastWakeTime = xTaskGetTickCount();
//  // Initialise the xLastWakeTime variable with the current time.

  while (true){
    // Wait for the next cycle.
    /* Delay a task until */
  //  vTaskDelayUntil( &xLastWakeTime, RNG_DELAY_MS );
    // Perform action here.   
    //this is where i run my main code 
    /* Tasks must be implemented to never return... */
    movementAnalyzer();
  }
  /*
  while (true)
  { // call main task
    movementAnalyzer();
    vTaskDelay(RNG_DELAY_MS);
  }*/
}
/** @brief  determines if a tag is considered wanting access. 
*           sending message through uart if access is granted.
*/

#if DEBUG_MOVEMENTSTATE == 0
static int movementAnalyzer(void) {
  xMessage message;
  int index = -1;
  
  //if queue is empty, do nothing
  if( xQueue != NULL){
    if(xQueueReceive(xQueue,&(message),(TickType_t)100) ==pdPASS) {

      switch(message.event) { // do this depending on event value.
        
        case NEW_TAG: // adds a new tag if taglist isn't full
          newTag(tag,message);
          break;
        
        case UPDATE_TAG: // updates a specific tags data, if tag is on the list
          if((index = tagOnList(tag,message.id)) !=-1) { 
              if(updateTag(&tag[index],message)) {
              }
          }
          break;
        
        case DELETE_TAG:  // deletes a tag if id on list.
          deleteTag(tag,message.id);
          break;

        default:
          break;
      }
    }
  }
}

//--------------------------helper functions-------------------------
/**@brief   checking if the tagid is on the list.
*
* @param[in] tag *    tag list
* @param[in] id       the id to check after
* @param[out] i       the index of the id.
* @param[out] -1      if the id was not on the list
*/
static int tagOnList(tags * tag, uint64_t id) {

  for(int i = 0; i <TAGLISTSIZE; i++) {
    if((id == tag[i].message.id) && (id != 0)) {
      return i;
    }
  }
  return -1;
}

/**@brief   deletes a tag, if id is on list.
*
* @param[in] tag*     tag list
* @param[in] id       the id to remove from the list
* @param[out] true    tag removed from list
* @param[out] false   tag is not on list
*/
static _Bool deleteTag(tags * tag, uint64_t id) {

  for(int i = 0; i < TAGLISTSIZE;i++) {
    if(tag[i].message.id == id) {
      tag[i] = default_tag;
      return true;
    }
  }
  return false;
}

/**@brief   adds a new tag if there is space
*
* @param[in] tag*     tag list
* @param[in] message  the recived message
* @param[out] true    tag added to list
* @param[out] false   tag list is full
*/
static _Bool newTag(tags *tag,xMessage message) { 

  for(int i = 0; i < TAGLISTSIZE;i++) {
    if(!tag[i].taken) {
      tag[i].taken = true;
      tag[i].message = message;
      if(tagAnalysis(&tag[i])) {
        deleteTag(&tag[i],message.id);
      }
      return true;
    }
  }
  return false;
}

/**@brief   updates tag distance
*
* @param[in] tag*     tag list
* @param[in] message  the recived message
* @param[out] true    tag granted access
* @param[out] false   tag not granted access
*/
static int updateTag(tags* tag, xMessage message) {
  tag->message = message;
  if(tagAnalysis(tag)) {

    deleteTag(tag,message.id);
    return true;
  }
  return false;
}

/**@brief   checks if tag is on ignorelist, or if tag is more than MAXDISTANCE
*           away(10 m.). if not analyizes the movement of the tag. 
*
* @param[in] tag*     tag list
* @param[out] true    tag granted access
* @param[out] false   tag not granted access
* @param[out] -1      tag on ignorelist
* @param[out] -2      tag put on ignorelist
*/
static uint32_t tagAnalysis(tags * tag) {
#if DEBUG_EVENT == 0
    if(onIgnorelist(tag->message.id)) 
    {
       return -1; // skip this transmission
    } else {
    distance = tag->message.tof*SPEED_OF_LIGHT;
    if(distance > 10) {
      putOnIgnorelist(tag->message.id);
      return -2;
    }
    else if(analysis(tag, distance)){
      uint32_t tmp[2];
      tmp[0] = tag->message.id>> 32;
      tmp[1] = tag->message.id & 0xffffffff;
      char buff[UART_MESSAGE_FORMAT_SIZE];
      snprintf(buff,sizeof(buff),"%s-%08x%08x",WANTSACCESS, tmp[0],tmp[1]);

      uartTransmit(buff,UART_MESSAGE_FORMAT_SIZE);
      if(xStatusQueue != NULL){
        tag->message.event = DELETE_TAG;
          if(xQueueSend(xStatusQueue,(void *)&tag->message,0)== pdPASS){
            //all is good
        }
  }
      return true;
    }
    return false;
  }
}


// -----------------------DEBUGGING CODE-------------------------------

 #elif DEBUG_EVENT == 3
      counter++;
      if(counter % 2 == 0) {
        tag->message.id = counter;
      } else {
        tag->message.id = counter-1;
      }

    if(onIgnorelist(tag->message.id)) 
    {
       return -1; // skip this transmission
    }  
    distance = tag->message.tof*SPEED_OF_LIGHT;
    if(distance > MAXDISTANCE) {
      putOnIgnorelist(tag->message.id);
    }
    printf("Distance : %f\r\n",distance);
    }

#elif DEBUG_EVENT == 2 
    if(onIgnorelist(tag->message.id)) 
    {
       return -1; // skip this transmission
    }  
          distance = tag->message.tof*SPEED_OF_LIGHT;
    if(distance > MAXDISTANCE) {
      putOnIgnorelist(tag->message.id);
    }
    printf("Distance : %f\r\n",distance);
    if (analysis(tag, distance)){
        printf("_________________Signal_________________\r\n");
        LEDS_ON(BSP_LED_0_MASK);
        vTaskDelay(2000);
        LEDS_OFF(BSP_LED_0_MASK);
        }
    }



#elif DEBUG_EVENT == 1
    if(tag_id == 0) {
      if(tag->message.id != 0) {
        tag_id = tag->message.id;
        int old_delay = delay;
        distance[cal] = tag->message.tof * SPEED_OF_LIGHT;
        printf("Distance : %f\r\n",distance[cal]);
        cal++;
        if(cal == AVG) {
           delay = calibrate_device(distance, delay);
           cal = 0;
           if(old_delay == delay) {
              printf("set TX_ANT_DLY and RX_ANT_DLY in main to %d",delay);
              exit(0);
           }
        }
      }
   }
}
#endif
#elif DEBUG_MOVEMENTSTATE == 1
static int movementAnalyzer(void)
{
  xMessage message;
  int index = -1;

//ticktype decides for how long the task should block before giving up.
//this value should be set, so it fits with dani's time. or figure out how to block until queue got data.
//takes a full copy instead of pointer, incase data is overwritten before handled
  if( xQueue != NULL){
    if(xQueueReceive(xQueue,&(message),(TickType_t)100000000) ==pdPASS) {
 
      switch(message.event) { 
    
        case NEW_TAG:
          if(newTag(tag,message)) {
            printf("new tag added id: %d\r\n",(int)message.id);
          }else {
            printf("taglist is full!\r\n");
          }
          //tag list is full!
          break;

        case UPDATE_TAG:
            if((index = tagOnList(tag,message.id)) !=-1) { 
                if(!updateTag(&tag[index],message)){
                //printf("updatedtag! id: %d\r\n",(int) tag[index].message.id);
                }
            } else {
            printf("update, id not on list! id: %d\r\n",(int) message.id);
          }
          //do something else 
          break;

        case DELETE_TAG:
          if(deleteTag(tag,message.id)){
            printf("tag deleted! id: %d\r\n",(int)message.id);
          } else {
            printf("DELETE tag is not on list! id: %d\r\n",(int)message.id);
          }
          break;

         default:
          printf("something went very wrong in movementAnalyzer - switch\r\n");
      }
    }
  } else {
    printf("queue is empty\r\n");
  }

}

//--------------------------helper functions-------------------------
/**@brief checking if the tagid is on the list.
*
* @param[in] tag[]    tag list
* @param[in] message  the recived message
* @param[out] i       the location of the id.
* @param[out] -1      if the id was not on the list
*/
static int tagOnList(tags * tag, uint64_t id) {

  for(int i = 0; i <TAGLISTSIZE; i++) {
    if((id == tag[i].message.id) && (id != 0)) {
      return i;
    }
  }
  return -1;
}

//what do we wish to do here? set id = 0?
static _Bool deleteTag(tags * tag, uint64_t id) {

  for(int i = 0; i < TAGLISTSIZE;i++) {
    if(tag[i].message.id == id) {
      tag[i] = default_tag;
      return true;
    }
  }
  return false;
}

// this depends on deleteTag....
static _Bool newTag(tags *tag,xMessage message) { 

  for(int i = 0; i < TAGLISTSIZE;i++) {
    if(!tag[i].taken) {
      tag[i].taken = true;
      tag[i].message = message;
      if(tagAnalysis(&tag[i])) {
        printf("access granted! deleted tag id:%d \r\n",(int)message.id);
        deleteTag(&tag[i],message.id);
      }
      return true;
    }
  }
  return false;
}

static int updateTag(tags* tag, xMessage message) {
  tag->message = message;
  if(tagAnalysis(tag)) {
    printf("access granted! deleted tag id:%d \r\n",(int)message.id);
    deleteTag(tag,message.id);
    return true;
  }
  return false;
}

static uint32_t tagAnalysis(tags * tag) {
    if(onIgnorelist(tag->message.id)) 
    {
          // skip this transmission
          return -1;
    } else {

    distance = tag->message.tof*SPEED_OF_LIGHT;
    //printf("Distance : %f\r\n",distance);
    if(distance > 10) {
      putOnIgnorelist(tag->message.id);
      return -2;
    }

    else if(analysis(tag, distance)){
   //   return (int)uartTransmit(NRF_BAUD); //transmit something that says this Id wants acces!
         if(xStatusQueue != NULL){
        tag->message.event = DELETE_TAG;
          if(xQueueSend(xStatusQueue,(void *)&tag->message,0)== pdPASS){
            //all is good
        }
  }
     return true;
    }
    return false;
  }
}
#endif