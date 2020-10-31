/*!
* @brief Component name:	Ignorelist
*
* handles tags that are 10 or more meters away
*
* @file ignorelist.c
*/

#include "ignorelist.h"
#include "app_timer.h"

APP_TIMER_DEF(m_pt100_timer_id);


static void setupTimer() {
  app_timer_init();
  app_timer_create(&m_pt100_timer_id,APP_TIMER_MODE_SINGLE_SHOT,timer_handler);
}

static void timer_handler(void * p_context) {
// remove ID from ignorelist

}

// also need to make some static ignorelist. 

_Bool onIgnorelist(unsigned long int id){
  
}

void putOnIgnorelist(unsigned long int id) {
  if(app_timer_cnt_get()
  app_timer_start(&m_pt100_timer_id, APP_TIMER_TICKS(IGNORETIME), NULL);
}
