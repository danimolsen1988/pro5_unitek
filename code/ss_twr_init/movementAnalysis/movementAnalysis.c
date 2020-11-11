/** @file movementAnalysis.c
 * 
 * @brief 
 *
 * @par       
 * 
 */  

#include "movementAnalysis.h"
State_type State;

bool analysis(tags *tag, double distance) //call this function in main file
{
  if (tag->old_dist1 == 0){
    tag->i = 1;
   }
  double average_distance = ma_filter4(distance, tag->old_dist1, tag->old_dist2, tag->old_dist3); 
  double velocity = central_difference(average_distance, tag->old_avg3); //using a central difference filter to calculate velocity

  tag->old_dist3 = tag->old_dist2;
  tag->old_dist2 = tag->old_dist1;
  tag->old_dist1 = distance;
  tag->old_avg3 = tag->old_avg2;
  tag->old_avg2 = tag->old_avg;
  tag->old_avg = average_distance;
  

  if (average_distance < 1.2){ //distance from anchor to tag
    if (velocity < 0.01){ //velocity on tag
      tag->i++;
        if (tag->i == 6){
          tag->i = 0;
          return true;
        }
        return false;
      vTaskDelay(200);
    }
      else{
        tag->i = 0;
        return false;
      }
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
double central_difference(double avg_dist, double old_avg3){
  float coef1 = 0.5;
  float coef2 = -0.5;
  double cd_velocity = (avg_dist*coef1 + old_avg3*coef2);
  cd_velocity = abs_val(cd_velocity);
  return cd_velocity;
}
