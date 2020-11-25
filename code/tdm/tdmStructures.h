#ifndef TDM_STRUCTURES_H
#define TDM_STRUCTURES_H

#include "deca_device_api.h"

typedef union {
  uint64_t addr;
  uint8 addrArr[8];
}uwbAddress;

// event types
typedef enum {
  UPDATE_TAG = 0,
  DELETE_TAG = 1,
  NEW_TAG = 2
} event_type;

#endif /* TDM_STRUCTURES_H */

/*** end of file ***/