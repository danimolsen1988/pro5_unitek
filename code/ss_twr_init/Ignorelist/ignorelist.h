/*!
* @brief Component name:	Ignorelist
*
* handles tags that are 10 or more meters away
*
* @file ignorelist.h
*/

#define IGNORETIME 2000 // in ms

/**@brief       Function for checking if id os on ignorelist
 *
 * @param[in]  id           : Tag id
 * @param[out] _bool        : true if on ignorelist, false if not
 */
_Bool onIgnorelist(unsigned long int id);

/**@brief       Put a id on ignore list
 *
 * @param[in]  id           : Tag id
 */
void putOnIgnorelist(unsigned long int id);