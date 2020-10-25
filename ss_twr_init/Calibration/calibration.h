/*!
* @brief Component name:	Calibration
*
* Defines calibration function for dwm1001 
*
* @file calibration.h
*/
#include "deca_device_api.h"

#define AVG 200  // number of samples averaged to get more precise calibration
#define TRUE_DISTANCE 1 //actual distance between tag and anchor
#define RES 0.00469 // meters (DWT_TIME_UNITS* SPEED_OF_LIGHT)


/**@brief       Function for calibrating a device using the reference device.
 *
 * @param[in]  distance[AVG]: an array of n distance samples 
 * @param[in]  delay        : the currently used delay.
 * @param[out] int          : new calculated antenna delay || old if within set range.
 */
int calibrate_device(double distance[AVG], int delay);