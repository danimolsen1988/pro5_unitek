/** @file movementAnalysis.c
 * 
 * @brief 
 *
 * @par       
 * 
 */ 

#include "movementAnalysis.h"

//save old distance and average to calculate velocity
static double old_avg = 0;
static double old_avg2 = 0;
static double old_avg3 = 0;
static double old_dist1 = 0;
static double old_dist2 = 0;
static double old_dist3 = 0;


// enum used for the state machine
typedef enum{
First,
Second,
Third,
} State_type; 
State_type State;

//Abs value, moving average, central difference and analysis functions
double abs_val(double y);
double ma_filter3(double a, double b, double c);
double ma_filter4(double a, double b, double c, double d);
double ma_filter10(double a, double b, double c, double d, double e, double f, double g, double h, double i, double j);
void analysis(double distance);
double central_difference(double avg_dist);

void analysis(double distance) //call this function in main file
{
  double average_distance = ma_filter4(distance, old_dist1, old_dist2, old_dist3); 
  //printf("Distance : %f m\r\n",average_distance); //prints the distance in same style as transmission
  printf("%f,",average_distance); //prints distance for putty.log
    
  double velocity = central_difference(average_distance); //using a central difference filter to calculate velocity
  //printf("Velocity : %f m/s\r\n",velocity); //prints the velocity in same style as transmission
  printf("%f\r\n",velocity); //prints velocity for putty.log

  // will most likely be swapped out for circular buffers 
  old_dist3 = old_dist2;
  old_dist2 = old_dist1;
  old_dist1 = distance;
  old_avg3 = old_avg2;
  old_avg2 = old_avg;
  old_avg = average_distance;

  
  // making a 3 stage state machine, to filter out people passing the door
  if (average_distance < 1.2){ //distance from anchor to tag
    if (velocity < 0.01){ //velocity on tag
      switch(State)
      {
        case First :
         {
          State = Second;
          break;
          }
        case Second : 
        {
          State = Third;
          break;
          }
        case Third :
        {
          printf("_________________Signal_________________\r\n");
          State = First;
          break;
          }
        default : 
        {
          State = First;
          break;
          }
          }
  }
  else State = First;
  }
}



// fabs() returns a wrong number, so I made my own 
double abs_val(double y) 
{
  if(y<0)
    return(y*-1);
  else
    return(y);
}


// we need a moving average filter to give us more reliable results [1/3 1/3 1/3]
double ma_filter3(double a, double b, double c)
{
  double total = a+b+c;
  total = total/3;
  return total;
}

// 4 coefficient MA filter
double ma_filter4(double a, double b, double c, double d)
{
  double total = a+b+c+d;
  total = total/4;
  return total;
}

// 10 coefficient MA filter
double ma_filter10(double a, double b, double c, double d, double e, double f, double g, double h, double i, double j)
{
  double total = a+b+c+d+e+f+g+h+i+j;
  total = total/10;
  return total;
}

// central difference filter to get a more reliable velocity [0.5 0 -0.5]
double central_difference(double avg_dist){
  float coef1 = 0.5;
  float coef2 = -0.5;
  double cd_velocity = (avg_dist*coef1 + old_avg3*coef2);
  cd_velocity = abs_val(cd_velocity);
  return cd_velocity;
}
