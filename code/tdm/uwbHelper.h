#ifndef UWB_HELPER_H
#define UWB_HELPER_H

#include "deca_device_api.h"

void setMsgField(uint8 * field, uint8 * data, int length);
void getMsgField(uint8 * field, uint8 * buffer, int length);

#endif /* UWB_HELPER_H */

/*** end of file ***/