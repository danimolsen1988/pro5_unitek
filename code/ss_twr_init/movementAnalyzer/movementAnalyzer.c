/*! ----------------------------------------------------------------------------
*  @file    movementAnalysis.c
*  @brief   Single-sided two-way ranging (SS TWR) initiator example code
*
*           This is a simple code example which acts as the initiator in a SS TWR distance measurement exchange. This application sends a "poll"
*           frame (recording the TX time-stamp of the poll), after which it waits for a "response" message from the "DS TWR responder" example
*           code (companion to this application) to complete the exchange. The response message contains the remote responder's time-stamps of poll
*           RX, and response TX. With this data and the local time-stamps, (of poll TX and response RX), this example application works out a value
*           for the time-of-flight over-the-air and, thus, the estimated distance between the two devices, which it writes to the LCD.
*
*
*           Notes at the end of this file, expand on the inline comments.
* 
* @attention
*
* Copyright 2015 (c) Decawave Ltd, Dublin, Ireland.
*
* All rights reserved.
*
* @author Decawave
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


/* Hold copy of status register state here for reference so that it can be examined at a debug breakpoint. */
static uint32 status_reg = 0;

/* Declaration of static functions. */
static int tagOnList(tags * tag, uint64_t id);
static int updateTag(tags* tag, xMessage message); // should this return a int?
static _Bool newTag(tags tag[],xMessage message);
static _Bool deleteTag(tags* tag, uint64_t id);
static _Bool tagAnalysis(tags* tag);

static tags tag[TAGLISTSIZE] = {0};  //initializer element is not a compile time constant


extern xQueueHandle xQueue;
//since global structures have static storage duration, it will be initailzed to all 0's.
const tags default_tag;

// calibration
#ifdef CALIBRATE
static double distance[AVG];
static int cal = 0;
static int delay = 0;
#elif defined (TEST)
/* Inter-ranging delay period, in milliseconds. */
#define RNG_DELAY_MS 500
uint64_t tag_id;
static uint64_t counter = 0;
static double distance;
static double tof;

#else
/* Inter-ranging delay period, in milliseconds. */
#define RNG_DELAY_MS 1000
/* Hold copies of computed time of flight, distance and partid here for reference so that it can be examined at a debug breakpoint. */
static double tof;
static int test = 0;
static double distance;
#endif
/*! ------------------------------------------------------------------------------------------------------------------
* @fn main()
*
* @brief Application entry point.
*
* @param  none
*
* @return none
*/
static int movementAnalyzer(void)
{
  xMessage message;
  int index = -1;

//ticktype decides for how long the task should block before giving up.
//this value should be set, so it fits with dani's time. or figure out how to block until queue got data.
//takes a full copy instead of pointer, incase data is overwritten before handled
  if( xQueue != NULL){
    if(xQueueReceive(xQueue,&(message),(TickType_t)100) ==pdPASS) {
 
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
                printf("updatedtag! id: %d\r\n",(int) tag[index].message.id);
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
          printf("why did we hit default?\r\n");
  //
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

static _Bool tagAnalysis(tags * tag) {
  #ifdef TEST
      counter++;
      if(counter % 2 == 0) {
        tag_id = counter;
      } else {
        tag_id = counter-1;
      }
          distance = tag.message.tof*SPEED_OF_LIGHT;
    if(distance > 10) {
      putOnIgnorelist(tag.message.id);
    }
    printf("Distance : %f\r\n",distance);
    if (analysis(&tag1, distance)){
        printf("_________________Signal_________________\r\n");
        LEDS_ON(BSP_LED_0_MASK);
        vTaskDelay(2000);
        LEDS_OFF(BSP_LED_0_MASK);
        }
#endif

    if(onIgnorelist(tag->message.id)) 
    {
          // skip this transmission
          return -1;
    } else {


#ifndef CALIBRATE
    distance = tag->message.tof*SPEED_OF_LIGHT;
    printf("Distance : %f\r\n",distance);
    if(distance > 10) {
      putOnIgnorelist(tag->message.id);
      return -2;
    }

    else if(analysis(tag, distance)){
   //   return (int)uartTransmit(NRF_BAUD); //transmit something that says this Id wants acces!
     return true;
    }
    return false;
#else


      int old_delay = delay;
      distance[cal] = tof * SPEED_OF_LIGHT;
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

#endif
  }
  
}
/**@brief SS TWR Initiator task entry function.
*
* @param[in] pvParameter   Pointer that will be used as the parameter for the task.
*/
void movementAnalyzer_initiator (void * pvParameter)
{
  UNUSED_PARAMETER(pvParameter);

  //dwt_setrxtimeout(RESP_RX_TIMEOUT_UUS);

  dwt_setleds(DWT_LEDS_DISABLE);

  while (true)
  {
    movementAnalyzer();
    /* Delay a task for a given number of ticks */
    vTaskDelay(RNG_DELAY_MS);
    /* Tasks must be implemented to never return... */
  }
}