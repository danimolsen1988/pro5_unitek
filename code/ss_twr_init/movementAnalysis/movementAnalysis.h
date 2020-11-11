/** @file movementAnalysis.h
 * 
 * @brief 
 *
 * @par       
 * 
 */ 

#ifndef MOVEMENTANALYSIS_H
#define MOVEMENTANALYSIS_H

#include <stdio.h>
#include "boards.h"
#include "stdbool.h"

typedef struct Movement{
//save old distance and average to calculate velocity
  double old_avg;
  double old_avg2;
  double old_avg3;
  double old_dist1;
  double old_dist2;
  double old_dist3;
  int i;
}tags;


//Abs value, moving average, central difference and analysis functions
double abs_val(double y);
double ma_filter3(double a, double b, double c);
double ma_filter4(double a, double b, double c, double d);
double ma_filter10(double a, double b, double c, double d, double e, double f, double g, double h, double i, double j);
double central_difference(double avg_dist, double old_avg3);
bool analysis(tags *tag, double distance);


// enum used for the state machine
typedef enum{
First,
Second,
Third,
} State_type; 


#endif /* MOVEMENTANALYSIS_H */

/*** end of file ***/

