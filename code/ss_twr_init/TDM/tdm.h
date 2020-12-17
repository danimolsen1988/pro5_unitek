/** @file movementAnalysis.h
 *       
 * 
 */ 

#ifndef TDM_H
#define TDM_H

#include "deca_device_api.h"
#include "movementStruct.h"
#include "../../code/tdm/tdmStructures.h"

typedef enum {
  DISCOVER,
  SLOT_ONE,
  SLOT_TWO,
  SLOT_THREE,
  IDLE
}tdmState;


typedef struct {
 uwbAddress address;
 int timeoutCount;
 bool free;
 event_type event;
} tdmSlot;

typedef struct {
  tdmSlot slotOne;
  tdmSlot slotTwo;
  tdmSlot slotThree;
  int slotsFree;
}tdmOrganizer;


#endif /* TDM_H */

/*** end of file ***/