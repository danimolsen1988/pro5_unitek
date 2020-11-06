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
#include "app_fifo.h"

// timer def
APP_TIMER_DEF(m_ss_timer_id0);
APP_TIMER_DEF(m_ss_timer_id1);
APP_TIMER_DEF(m_ss_timer_id2);
APP_TIMER_DEF(m_ss_timer_id3);
APP_TIMER_DEF(m_ss_timer_id4);



// ignore list with 5 spaces
static volatile unsigned long long int ignorelist[LISTSIZE] = {0};
static volatile int length = 0;  // for next empty position in list.
static bool initialized = false; // for setup
static volatile int timer = 0;

static void lfclk_request();
static _Bool putOnList(app_timer_id_t timer_id, unsigned long long int id,uint8_t index);
static void createTimer(app_timer_id_t timer_id);
static void timer_handler(void * p_context);
 
//fifo stuff
 app_fifo_t ignorelistFifo; //fifo 

uint8_t id_index[4];

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

    err_code = app_fifo_init(&ignorelistFifo, id_index,(uint16_t)sizeof(id_index));  // init of fifo
    APP_ERROR_CHECK(err_code);
    initialized = true;
    // do the initialization part
  } else {
    printf("timer is already intialized!"); 
  }


}


_Bool onIgnorelist(unsigned long long int id){
  int i = 0;
  while(i < LISTSIZE) {
    if(id == ignorelist[i]) {
        return true;
    }
    i++;

  }
  return false;
}


void putOnIgnorelist(unsigned long long int id) {

  switch(timer) { 
    case 0:
     if(!putOnList(m_ss_timer_id0, id, timer)) {
        break;
     }
    //  printf("\ntimer0 \n%d\n",timer);
      timer = 1;
      break;
    case 1:
     if(!putOnList(m_ss_timer_id1, id, timer)) {
        break;
     }
    //  printf("\ntimer1\%d\n",timer);
      timer = 2;
      break;
    case 2:
     if(!putOnList(m_ss_timer_id2, id, timer)) {
        break;
     }
  //    printf("\ntimer2\%d\n",timer);
      timer = 3;
      break;
    case 3:
     if(!putOnList(m_ss_timer_id3, id, timer)) {
        break;
     }
 //     printf("\ntimer3\%d\n",timer);
      timer = 0;
      break;
    case 4:
     if(!putOnList(m_ss_timer_id4, id, timer)) {
        break;
     }
 //     printf("\ntimer4\%d\n",timer);
      timer = 0;
      break;
    default:
    printf("\n%d\n",timer);
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
static _Bool putOnList(app_timer_id_t timer_id, unsigned long long int id, uint8_t index) {
      ret_code_t err_code;
      err_code = app_fifo_put(&ignorelistFifo,index);
      if(err_code == NRF_SUCCESS) {
        err_code = app_timer_start(timer_id, APP_TIMER_TICKS((IGNORETIME/20)), &index);
        APP_ERROR_CHECK(err_code);
        ignorelist[index] = id;
        return true;
      }
      return false;
        //only if timer startet succesfully put id on ignorelist     

     
}


/**
 * @brief timerhandler for timers
 *  
 */
static void timer_handler(void * p_context) {
// remove ID from ignorelist
  uint8_t tmp;
  app_fifo_get(&ignorelistFifo,&tmp);
  ignorelist[tmp] = 0;
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