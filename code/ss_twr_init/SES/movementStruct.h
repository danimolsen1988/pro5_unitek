/*!
* @brief Component name:	movementStruct
*
* struct with needed movement data
*
* @file movementStruct.h
*/

typedef enum {
  UPDATE_TAG,
  DELETE_TAG,
  NEW_TAG
} event_type;


/**@brief       struct for event data
 *
 * @data  event_type[event]   : the type of event to do 
 * @data  uint64_t[id]        : id of the tag
 * @data  double[old_avg]     : newest average of distance measurment
 * @data  double[old_avg2]    : 2. newest average of distance measurement
 * @data  double[old_avg3]    :
 * @data  double[old_dist1]
 * @data  double[old_dist2]
 * @data  double[old_dist3]
 * @data  int[i]
 */
typedef struct Movement{
//save old distance and average to calculate velocity
  event_type event;
  uint64_t id;
  double old_avg;
  double old_avg2;
  double old_avg3;
  double old_dist1;
  double old_dist2;
  double old_dist3;
  int i;
}tags;