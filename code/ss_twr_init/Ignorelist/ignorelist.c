/*!
* @brief Component name:	Ignorelist
*
* handles tags that are 10 or more meters away
*
* @file ignorelist.c
*/

#include "ignorelist.h"
#include "app_timer.h"
#include "nrf_drv_clock.h"
#include <stdlib.h>

// timer def
APP_TIMER_DEF(m_ss_timer_id0);
APP_TIMER_DEF(m_ss_timer_id1);
APP_TIMER_DEF(m_ss_timer_id2);
APP_TIMER_DEF(m_ss_timer_id3);
APP_TIMER_DEF(m_ss_timer_id4);




// ignore list with 5 spaces
static volatile unsigned long int ignorelist[LISTSIZE] = {0};
static int length = 0;  // for next empty position in list.
static bool initialized = false; // for setup

static void lfclk_request();
static void putOnList(app_timer_id_t timer_id, unsigned long int id);
static void createTimer(app_timer_id_t timer_id);

/**
*
* should be called in main
*/
extern void setupTimer() {
  if (!initialized) {
    ret_code_t err_code;

    lfclk_request();

    // initialize timer module
    err_code = app_timer_init();
    APP_ERROR_CHECK(err_code);

    createTimer(m_ss_timer_id0);
    createTimer(m_ss_timer_id1);
    createTimer(m_ss_timer_id2);
    createTimer(m_ss_timer_id3);
    createTimer(m_ss_timer_id4);
    initialized = true;
    // do the initialization part
  } else {
    printf("timer is already intialized!"); 
  }


}


_Bool onIgnorelist(unsigned long int id){
  int i = 0;
  while(i <= length) {
    if(id == ignorelist[i]) { 
    return true;
    }
    i++;
  }
  return false;
}


void putOnIgnorelist(unsigned long int id) {
  if(length > LISTSIZE) {
    printf("list is full!");
    return;
  }

  switch(length) { 
    case 0:
      putOnList(m_ss_timer_id0, id);
      break;
    case 1:
      putOnList(m_ss_timer_id1, id);
      break;
    case 2:
      putOnList(m_ss_timer_id2, id);
      break;
    case 3:
      putOnList(m_ss_timer_id3, id);
      break;;
    case 4:
      putOnList(m_ss_timer_id4, id);
      break;
    default:
      break;
  }

}
/**
 * @brief intern Function starting the internal LFCLK oscillator.
 *
 */
static void lfclk_request()
{
    ret_code_t err_code = nrf_drv_clock_init();
    APP_ERROR_CHECK(err_code);
    nrf_drv_clock_lfclk_request(NULL);
}

/**
 * @brief intern Function for starting timer
 *
 */
static void putOnList(app_timer_id_t timer_id, unsigned long int id) {
      ret_code_t err_code;
      err_code = app_timer_start(timer_id, APP_TIMER_TICKS((IGNORETIME/20)), NULL);
      APP_ERROR_CHECK(err_code);
        //only if timer startet succesfully put id on ignorelist
      ignorelist[length] = id;
      length++;
}

/**
 * @brief timerhandler for timers
 *
 */
static void timer_handler(void * p_context) {
// remove ID from ignorelist
  length--;
  ignorelist[length] = 0;
}

/**
 * @brief intern function for creating timer
 *
 */
static void createTimer(app_timer_id_t timer_id) {
  ret_code_t err_code;
  err_code = app_timer_create(&timer_id,
                              APP_TIMER_MODE_SINGLE_SHOT,
                              timer_handler);
  APP_ERROR_CHECK(err_code);
}

/**
* @depricated
* @breif could be used to increase/decrease ignorelist size
*
#define LISTDOUBLE 2 

static unsigned long int * ignorelist;

static void increaseList() {
  ignorelist = (unsigned long int *)realloc(ignorelist, sizeof(ignorelist)*LISTDOUBLE);
    if(ignorelist == NULL) {
      printf("failed to alocate space for ignore list");
      exit(1);  // SKAL LAVES OM TIL NOGET DER HÅNDTER FEJLEN.
      memset(ignorelist+(sizeof(ignorelist)/2),0,sizeof(ignorelist)/2);
  }
}
static void decreaseList() {
  ignorelist = (unsigned long int *)realloc(ignorelist, sizeof(ignorelist)/LISTDOUBLE);
    if(ignorelist == NULL) {
      printf("failed to alocate space for ignore list");
      exit(1);  // SKAL LAVES OM TIL NOGET DER HÅNDTER FEJLEN.
  }
}

*/