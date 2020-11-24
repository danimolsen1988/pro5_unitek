/** @file movementAnalysis.h
 *       
 * 
 */ 

#ifndef TDM_H
#define TDM_H

#include "deca_device_api.h"
#include "movementStruct.h"

typedef enum {
  DISCOVER,
  SLOT_ONE,
  SLOT_TWO,
  SLOT_THREE,
  IDLE
}tdmState;

typedef enum {
  TW,
  TR,
  TG,
  BC
}tdmEvent; 

typedef union {
  uint64_t addr;
  uint8 addrArr[8];
}uwbAddress;

typedef struct {
 uwbAddress address;
 int timeoutCount;
 bool free;
 tdmEvent event;
} tdmSlot;

typedef struct {
  tdmSlot slot1;
  tdmSlot slot2;
  tdmSlot slot3;
  int slotsFree;
}tdmOrginaizer;


void initTdm();
bool getTimeSlot(tdmSlot * freeSlot);
void buildMessage(uint8 * cmd, uint8 * target);
bool sendAndReceive(uint8 * tx_msg, int length);
void runTDMCycle(tdmSlot * slot, int slutNum);
void stepState(tdmEvent event);
static void setMsgField(uint8 *field, uint8 * data, int length);
void emptyTimeslot(tdmSlot * slot);
bool createEventMsg(uwbAddress address, tdmEvent eventType, int slot);
static void msgGetTs(uint8 *ts_field, uint32 *ts);
static void setNewStatus(xMessage * statusMsg);

#endif /* TDM_H */

/*** end of file ***/