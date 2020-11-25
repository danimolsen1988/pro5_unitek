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

/*
typedef enum {
  TW,
  TR,
  TG,
  BC
}tdmEvent; 
*/
/*
typedef union {
  uint64_t addr;
  uint8 addrArr[8];
}uwbAddress;
*/
typedef struct {
 uwbAddress address;
 int timeoutCount;
 bool free;
 event_type event;
} tdmSlot;

typedef struct {
  tdmSlot slot1;
  tdmSlot slot2;
  tdmSlot slot3;
  int slotsFree;
}tdmOrginaizer;


static void initTdm();
static void emptyTimeslot(tdmSlot * slot);
static void buildMessage(uint8 cmd, uint8 * target);
static bool sendAndReceive(uint8 * tx_msg, int length);
static void doBroadCast();
static void updateTimeouts(tdmSlot * slot, int slotNum);
static void doTagTransmission(tdmSlot * slot,int slotNum);
static bool createEventMsg(uwbAddress address, event_type event, int slot);
void stepState();
static void msgGetTs(uint8 *ts_field, uint32 *ts);
static void setNewStatus(xMessage * statusMsg);
static void setMsgField(uint8 *field, uint8 * data, int length);

#endif /* TDM_H */

/*** end of file ***/