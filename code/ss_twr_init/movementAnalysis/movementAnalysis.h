/** @file movementAnalysis.h
 *       
 * 
 */

#ifndef MOVEMENTANALYSIS_H
#define MOVEMENTANALYSIS_H

#include "app_timer.h"
#include "boards.h"
#include "nrf_drv_clock.h"
#include "stdbool.h"
#include <stdio.h>

#define DELAY 200            // delay for hardware timer in ms
#define ALARM_INDICATOR 5000 // delay for hardware timer in ms
#define ALARM_START 3000     // delay for hardware timer in ms

typedef struct Movement {
  //save old distance and average to calculate velocity
  double old_avg;
  double old_avg2;
  double old_dist1;
  double old_dist2;
  double old_dist3;
  int i;
} tags;

typedef enum {
  DO_NOTHING,
  REQUEST_ACCESS,
  START_ALARM
} MOVEMENT_PATTERN;

static bool delayTimerInitialized = false; // for setup
static bool delaySample = false;           //delay flag for hardware timer
static bool accessRequested = false;         // set a flag when access is granted
static bool alarmIndicator = false;        // flag to start indicator timer
static bool alarmStart = false;            // flag to start alarm timer

//Abs value, moving average, central difference and analysis functions
double abs_val(double y);
double ma_filter3(double a, double b, double c);
double ma_filter4(double a, double b, double c, double d);
double ma_filter10(double a, double b, double c, double d, double e, double f, double g, double h, double i, double j);
double central_difference(double avg_dist, double old_avg2);
int analysis(tags *tag, double distance);

#endif /* MOVEMENTANALYSIS_H */

/*** end of file ***/