/** @file movementAnalysis.h
 *       
 * 
 */ 

#ifndef TDM_H
#define TDM_H

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
  TG
}tdmEvent; 

typedef union {
  uint64_t addr;
  uint8_t addrArr[8];
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





#endif /* TDM_H */

/*** end of file ***/