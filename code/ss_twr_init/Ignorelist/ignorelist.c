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

APP_TIMER_DEF(m_ss_timer_id0);
APP_TIMER_DEF(m_ss_timer_id1);
APP_TIMER_DEF(m_ss_timer_id2);

#define LISTSIZE 3
#define LISTDOUBLE 2

// list is being allocated. it's not necessary as it is, 
// but made if dynamically allocated list should be needed.
static unsigned long int * ignorelist;
static int length = 0;  // for next empty position in list.

/**@brief Function starting the internal LFCLK oscillator.
 *
 */
static void lfclk_request()
{
    ret_code_t err_code = nrf_drv_clock_init();
    APP_ERROR_CHECK(err_code);
    nrf_drv_clock_lfclk_request(NULL);
}

static void timer_handler(void * p_context) {
// remove ID from ignorelist
  length--;
  ignorelist[length] = 0;
}


static void createTimer(app_timer_id_t timer_id) {
  ret_code_t err_code;
  err_code = app_timer_create(&timer_id,
                              APP_TIMER_MODE_SINGLE_SHOT,
                              timer_handler);
  APP_ERROR_CHECK(err_code);
}

/**
*
* should be called in main
*/
void setupTimer() {
  ret_code_t err_code;

  lfclk_request();

  err_code = app_timer_init();
  APP_ERROR_CHECK(err_code);

  createTimer(m_ss_timer_id0);
  createTimer(m_ss_timer_id1);
  createTimer(m_ss_timer_id2);

    
    //allocate ignorelist if timer were created succesfully
    ignorelist = (unsigned long int *)calloc(LISTSIZE,sizeof(unsigned long int));
  if(ignorelist == NULL) {
    printf("failed to allocate space for ignore list");
    exit(1);  // SKAL LAVES OM TIL NOGET DER HÅNDTER FEJLEN.
  }
}

// also need to make some static ignorelist. 

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

static void putOnList(app_timer_id_t timer_id, unsigned long int id) {
      ret_code_t err_code;
      err_code = app_timer_start(timer_id, APP_TIMER_TICKS(IGNORETIME), NULL);
      APP_ERROR_CHECK(err_code);
      ignorelist[length] = id;
      length++;
}


void putOnIgnorelist(unsigned long int id) {
  if(length > 2) {
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
    default:
      break;
  }

  //only if timer startet succesfully put id on ignorelist
}



/**
* @depricated
* @breif could be used to increase/decrease ignorelist size
*
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