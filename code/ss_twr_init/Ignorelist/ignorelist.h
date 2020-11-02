/*!
* @brief Component name:	Ignorelist
*
* handles tags that are 10 or more meters away
*
* @file ignorelist.h
*/

#define IGNORETIME 2000 // in ms 
#define LISTSIZE 5  // size of ignorelist


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