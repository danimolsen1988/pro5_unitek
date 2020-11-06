/*!
* @brief Component name:	Ignorelist
*
* handles tags that are 10 or more meters away
*
* @file ignorelist.c
*/

#include "ignorelist.h"


// timer def
APP_TIMER_DEF(m_ss_timer_id0);
APP_TIMER_DEF(m_ss_timer_id1);
APP_TIMER_DEF(m_ss_timer_id2);
APP_TIMER_DEF(m_ss_timer_id3);

typedef enum{ 
  timer0,
  timer1,
  timer2,
  timer3,
} States; 

// ignore list with 5 spaces
static volatile unsigned long int ignorelist[LISTSIZE] = {0};
static bool initialized = false; // for setup
static volatile int timer = 0;
static States state;

static void lfclk_request();
static _Bool putOnList(app_timer_id_t timer_id, unsigned long int id,uint8_t index);
static void createTimer(app_timer_id_t timer_id);
static void timer_handler(void * p_context);
 
//fifo stuff
app_fifo_t ignorelistFifo; //fifo 

uint8_t id_index[LISTSIZE];

/**
*
* should be called in main
*/
extern void setupTimer() {
  if (!initialized) {
    ret_code_t err_code;
    state = timer0;

    lfclk_request();

    // initialize timer module
    err_code = app_timer_init();
    APP_ERROR_CHECK(err_code);

    createTimer(m_ss_timer_id0);
    createTimer(m_ss_timer_id1);
    createTimer(m_ss_timer_id2);
    createTimer(m_ss_timer_id3);

    err_code = app_fifo_init(&ignorelistFifo, id_index,(uint16_t)sizeof(id_index));  // init of fifo
    APP_ERROR_CHECK(err_code);
    initialized = true;
    // do the initialization part
  } else {
    printf("timer is already intialized!"); 
  }


}

#ifdef TEST

_Bool onIgnorelist(unsigned long int id){
  int i = 0;
  while(i < LISTSIZE) {
    if(id == ignorelist[i]) {
    printf("id:%d is on ignorelist!\r\n",id);
        return true;
    }
    i++;

  }
  printf("id:%d is NOT on ignorelist!\r\n",id);
  return false;
}

void putOnIgnorelist(unsigned long int id) {

  switch(state) { 
    case timer0:
     if(!putOnList(m_ss_timer_id0, id, state)) {
      
      printf("timer module is full!\r\n",id);
        break;
     } else {
      printf("id:%d timer 0 started\r\n",id);
     }
      state = timer1;
      break;
    case timer1:
     if(!putOnList(m_ss_timer_id1, id, state)) {      
      printf("timer module is full!\r\n",id);
        break;
     } else {
      printf("id:%d timer 1 started\r\n",id);
     }
      state = timer2;
      break;
    case timer2:
     if(!putOnList(m_ss_timer_id2, id, state)) {
        printf("timer module is full!\r\n",id);
        break;       
     } else {
      printf("id:%d timer 2 started\r\n",id);
     }
      state = timer3;
      break;
    case timer3:
     if(!putOnList(m_ss_timer_id3, id, state)) {
        printf("timer module is full!\r\n",id);
        break;
     } else {
     printf("id:%d timer 3 started\r\n",id);
     }
      state = timer0;
      break;
    default:
      break;
  }

}
#else

_Bool onIgnorelist(unsigned long int id){
  int i = 0;
  while(i < LISTSIZE) {
    if(id == ignorelist[i]) {
        return true;
    }
    i++;

  }
  return false;
}

void putOnIgnorelist(unsigned long int id) {

  switch(state) { 
    case timer0:
     if(!putOnList(m_ss_timer_id0, id, state)) {
        break;
     }
      state = timer1;
      break;
    case timer1:
     if(!putOnList(m_ss_timer_id1, id, state)) {
        break;
     }
      state = timer2;
      break;
    case timer2:
     if(!putOnList(m_ss_timer_id2, id, state)) {
        break;
     }
      state = timer3;
      break;
    case timer3:
     if(!putOnList(m_ss_timer_id3, id, state)) {
        break;
     }
      state = timer0;
      break;
    default:
      break;
  }

}
#endif
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
static _Bool putOnList(app_timer_id_t timer_id, unsigned long int id, uint8_t index) {
      ret_code_t err_code;
      err_code = app_fifo_put(&ignorelistFifo,index);
      if(err_code == NRF_SUCCESS) {
        err_code = app_timer_start(timer_id, APP_TIMER_TICKS((IGNORETIME)), &index);
        APP_ERROR_CHECK(err_code);
        ignorelist[index] = id;
        return true;
      }
      return false;
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