/** @file movementAnalysis.h
 *
 *
 */

#ifndef MOVEMENTANALYSIS_H
#define MOVEMENTANALYSIS_H

#include <stdio.h>
#include "boards.h"
#include "stdbool.h"
#include "app_timer.h"
#include "nrf_drv_clock.h"
#include "../movementStruct/movementStruct.h"

#define DELAY 200 // delay for hardware timer in ms

static bool delayTimerInitialized = false; // for setup
static bool delaySample = false; //delay flag for hardware timer

//Abs value, moving average, central difference and analysis functions
double abs_val(double y);
double ma_filter3(double a, double b, double c);
double ma_filter4(double a, double b, double c, double d);
double ma_filter10(double a, double b, double c, double d, double e, double f, double g, double h, double i, double j);
double central_difference(double avg_dist, double old_avg3);
bool analysis(tags *tag, double distance);


#endif /* MOVEMENTANALYSIS_H */

/*** end of file ***/
