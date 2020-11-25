/** @file movementAnalysis.c
 * 
 * @brief 
 */  

#include "movementAnalysis.h"

APP_TIMER_DEF(delay_timer_id);

/**
 * @brief analyse the speed and distance of a tag
 *
 * @param[*tag]        : struct containing information about tag's distance to anchor
 * @param[distance]    : distance calculated from ss_init_main.c
 *
 * @return true if tag want access to door, and false if tag doesn't want access to door
 */
bool analysis(tags *tag, double distance) //call this function in main file
{

  double average_distance = ma_filter4(distance, tag->old_dist1, tag->old_dist2, tag->old_dist3); 
  double velocity = central_difference(average_distance, tag->old_avg3); //using a central difference filter to calculate velocity

  tag->old_dist3 = tag->old_dist2;
  tag->old_dist2 = tag->old_dist1;
  tag->old_dist1 = distance;
  tag->old_avg3 = tag->old_avg2;
  tag->old_avg2 = tag->old_avg;
  tag->old_avg = average_distance;
  
  if (delaySample == true){
    return false;
  }

  if (average_distance < 1.2){ //distance from anchor to tag
    if (velocity < 0.01){ //velocity on tag
      tag->i++;
        if (tag->i == 3){
          tag->i = 0;
          return true;
        }
      ret_code_t err_code;
      err_code = app_timer_start(delay_timer_id, APP_TIMER_TICKS(DELAY), NULL);
      APP_ERROR_CHECK(err_code);
      delaySample = true;
      return false;
    }
      else{
        tag->i = 0;
        return false;
      }
  }

}

/**
 * @brief timerhandler for timers
 */
static void delayTimerhandler(void * p_context) {
  delaySample = false;
}

/**
 * @brief intern function for creating timer
 *
 * @param[timer_id]        : timer id
 */
static void createDelayTimer(app_timer_id_t timer_id) {
  ret_code_t err_code;
  err_code = app_timer_create(&timer_id,
                              APP_TIMER_MODE_SINGLE_SHOT,
                              delayTimerhandler);
  APP_ERROR_CHECK(err_code);
}

/**
 * @brief setup for delay timer
 */
extern void setupDelayTimer() {
  if (!delayTimerInitialized) {
    createDelayTimer(delay_timer_id);
    delayTimerInitialized = true;
  } else {
    printf("delay timer is already intialized!"); 
  }
}


/**
 * @brief take a number and make it aboslute (fabs() returns a wrong number)
 *
 * @param[y]          : number to be made absolute
 */
double abs_val(double y) 
{
  if(y<0)
    return(y*-1);
  else
    return(y);
}

/**
 * @brief we need a moving average filter to give us more precise results [1/3 1/3 1/3]
 *
 * @param[a,b,c]          : 3 numbers to be averaged
 */
double ma_filter3(double a, double b, double c)
{
  double total = a+b+c;
  total = total/3;
  return total;
}

/**
 * @brief 4 coefficient moving average filter [1/4 1/4 1/4 1/4]
 *
 * @param[a,b,c,d]          : 4 numbers to be averaged
 */
double ma_filter4(double a, double b, double c, double d)
{
  double total = a+b+c+d;
  total = total/4;
  return total;
}

/**
 * @brief 10 coefficient moving average filter
 *
 * @param[a,b,c,d,e,f,g,h,i,j]    : 10 numbers to be averaged
 */
double ma_filter10(double a, double b, double c, double d, double e, double f, double g, double h, double i, double j)
{
  double total = a+b+c+d+e+f+g+h+i+j;
  total = total/10;
  return total;
}

/**
 * @brief central difference filter to get a more precise velocity [0.5 0 -0.5]
 *
 * @param[avg_dist]    : current average distance
 * @param[old_avg3]    : average distance for 3 samples ago
 */
double central_difference(double avg_dist, double old_avg3){
  float coef1 = 0.5;
  float coef2 = -0.5;
  double cd_velocity = (avg_dist*coef1 + old_avg3*coef2);
  cd_velocity = abs_val(cd_velocity);
  return cd_velocity;
}