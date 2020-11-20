#include "movementStruct.h"

static bool initialized = false; // for setup
extern xQueueHandle xQueue; //extern queue handle from main

//do some queue stuff, not done!
_Bool setupQueue() {
  if (!initialized) {
    if((xQueue = xQueueCreate(QUEUESIZE, sizeof(xMessage))) == NULL) {
      //queue was not created..
      printf("could not create queue!!"); 
      return NULL;
    }
    
    initialized = true;
    // do the initialization part
    return true;
  } else {
    printf("queue is already intialized!"); 
    return true;
  }
}