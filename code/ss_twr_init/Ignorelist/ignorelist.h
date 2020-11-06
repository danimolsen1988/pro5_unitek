/*!
* @brief Component name:	Ignorelist
*
* handles tags that are 10 or more meters away
*
* @file ignorelist.h
*/
#include "app_timer.h"
#include "nrf_drv_clock.h"
#include <stdlib.h>
#include "app_fifo.h"

#define IGNORETIME 4000 // in ms
#define LISTSIZE 4  // size of ignorelist


/**@brief       Setup function. Should be called on once before
 *              other functions in the libary is used
 *
 */
void setupTimer();


/**@brief       Function for checking if id os on ignorelist
 *
 * @param[in]  id           : Tag id
 * @param[out] _bool        : true if on ignorelist, false if not
 */
_Bool onIgnorelist(unsigned long int id);

/**@brief       Function for putting id on ignorelist
 *
 * @param[in]  id           : Tag id
 */
void putOnIgnorelist(unsigned long int id);