/*!
* @brief Component name:	movementStruct
*
* struct with needed movement data
*
* @file movementStruct.h
*/
#ifndef MOVEMENTSTRUCT_H
#define MOVEMENTSTRUCT_H

#include "FreeRTOS.h"
#include "queue.h"
typedef enum {
  UPDATE_TAG,
  DELETE_TAG,
  NEW_TAG
} event_type;

//size of queue containing tags struct
#define QUEUESIZE 20

//Queue handler. should only exist 1 place.



/**@brief       struct for event data
 *
 * @data  event_type[event]   : the type of event to do 
 * @data  uint64_t[id]        : id of the tag
 * @data  double[tof]         : time of flight
 */
typedef struct message{
  event_type event;
  uint64_t id;
  double tof;
}xMessage;

/**@brief       struct for event data
 *
 * @data  xMessage[message]   : struct containing message data.
 * @data  _Bool[taken]        : bool for checking if the tag is occupied
 * @data  double[old_avg]     : newest average of distance measurment
 * @data  double[old_avg2]    : 2. newest average of distance measurement
 * @data  double[old_avg3]    : 3. newest average of distance measurement
 * @data  double[old_dist1]   : newest distance measurement
 * @data  double[old_dist2]   : 2. newest distance measurement
 * @data  double[old_dist3]   : 3. newest distance measurement
 * @data  int[i]              : int counter for movementanalysis
 */
 struct tags_s{
  xMessage message;
   _Bool taken;
  double old_avg;
  double old_avg2;
  double old_avg3;
  double old_dist1;
  double old_dist2;
  double old_dist3;
  int i;
};

typedef struct tags_s tags;

/**@brief       Sets up a Queue for sending 
 *
 */
_Bool setupQueue();

#endif /* MOVEMENTSTRUCT_H */