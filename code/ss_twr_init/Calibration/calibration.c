/*!
* @brief Component name:	Calibration
*
* Simple calibration algorithm.
*
* @file calibration.c
*/

#include "calibration.h"
#include <stdio.h>

 // The delay value is in DWT_TIME_UNITS (15.65 picoseconds ticks)
int calibrate_device(double distance[AVG], int delay) {

  // average samples
  double avg_distance = 0;
  double diff = 0;
  for(int i = 0;i <= AVG;i++) {
    avg_distance += distance[i];
  }
  avg_distance = avg_distance/AVG;

  diff = avg_distance - TRUE_DISTANCE;
  if(diff >= 0.05 || diff <= -0.05) {
    
    double test = diff/RES;
    int new_dly = delay+((int)test);

    //sets tx and rx antenna delay.
    dwt_setrxantennadelay(new_dly);
    dwt_settxantennadelay(new_dly);

    return new_dly; // return calculated antenna delay
  }
  return delay; // return old delay if within close range of calculated.
}