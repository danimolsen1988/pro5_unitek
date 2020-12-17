#include "uwbHelper.h"

/*
* @brief fill a msg field with data
*
* @param {uint8*} field pointer on the frist bye of the field to be filled
*                 data value to be written
*                 length data length
*
* @return none
*/
void setMsgField(uint8 *field, uint8 * data, int length){
  for(int i = 0; i < length; i++){
    field[i] = data[i];
  }
}

/*
* @brief get msg field
*
* @param field {uint8_t*} pointer on the frist bye of the field to be fetched
*                         buffer buffer data is written to
*                         length buffer length
*
* @return none
*/
void getMsgField(uint8 * field, uint8 * buffer, int length){
  for (int i = 0; i < length; i++)
  {
    buffer[i] = field[i];
  }
}

