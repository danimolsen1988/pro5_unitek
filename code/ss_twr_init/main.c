/* Copyright (c) 2015 Nordic Semiconductor. All Rights Reserved.
 *
 * The information contained herein is property of Nordic Semiconductor ASA.
 * Terms and conditions of usage are described in detail in NORDIC
 * SEMICONDUCTOR STANDARD SOFTWARE LICENSE AGREEMENT.
 *
 * Licensees are granted free, non-transferable use of the information. NO
 * WARRANTY of ANY KIND is provided. This heading must NOT be removed from
 * the file.
 *
 */

#include "sdk_config.h"
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "bsp.h"
#include "boards.h"
#include "nordic_common.h"
#include "nrf_drv_clock.h"
#include "nrf_drv_spi.h"
#include "nrf_uart.h"
#include "app_util_platform.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"
#include "nrf_log.h"
#include "nrf.h"
#include "app_error.h"
#include "app_util_platform.h"
#include "app_error.h"
#include <string.h>
#include "port_platform.h"
#include "deca_types.h"
#include "deca_param_types.h"
#include "deca_regs.h"
#include "deca_device_api.h"
#include "../movementStruct/movementStruct.h"
#if DEBUG_MOVEMENTSTATE == 0 && DEBUG_EVENT == 0
#include "../uart/uart_fifo.h"
#else
#include "UART.h"

#endif
//-----------------dw1000----------------------------


static dwt_config_t config = {
    5,                /* Channel number. */
    DWT_PRF_64M,      /* Pulse repetition frequency. */
    DWT_PLEN_128,     /* Preamble length. Used in TX only. */
    DWT_PAC8,         /* Preamble acquisition chunk size. Used in RX only. */
    10,               /* TX preamble code. Used in TX only. */
    10,               /* RX preamble code. Used in RX only. */
    0,                /* 0 to use standard SFD, 1 to use non-standard SFD. */
    DWT_BR_6M8,       /* Data rate. */
    DWT_PHRMODE_STD,  /* PHY header mode. */
    (129 + 8 - 8)     /* SFD timeout (preamble length + 1 + SFD length - PAC size). Used in RX only. */
};

/* Preamble timeout, in multiple of PAC size. See NOTE 3 below. */
#define PRE_TIMEOUT 1000

/* Delay between frames, in UWB microseconds. See NOTE 1 below. */
#define POLL_TX_TO_RESP_RX_DLY_UUS 100 

/* rx and tx antenna delay*/
#if DEBUG_EVENT == 1
#define TX_ANT_DLY 0
#define RX_ANT_DLY 0
#else
#define TX_ANT_DLY 16434
#define RX_ANT_DLY 16434
#endif

//--------------dw1000---end---------------
extern _Bool setupTimer();
extern _Bool setupQueue();

TaskHandle_t  movementAnalyzer_initiator_handler;   /**< Reference to SS TWR Initiator FreeRTOS task. */
extern void movementAnalyzer_initiator (void * pvParameter);
extern void tdmTask (void * pvParameter);
TaskHandle_t  led_toggle_task_handle;   /**< Reference to LED0 toggling FreeRTOS task. */
TimerHandle_t led_toggle_timer_handle;  /**< Reference to LED1 toggling FreeRTOS timer. */

//DEBUGGING HANDLE
TaskHandle_t test_ss_init_main_handle;    // task handle for debugging task.
#if DEBUG_MOVEMENTSTATE == 1 || DEBUG_EVENT ==3
#define DEBUG_DELAY        1000           // delay for debugging
static _Bool test_ss_init_main_case(xMessage message);
static void test_ss_init_main(void * pvParameter);
#endif
// xQueue handle, to queue sending type xMessage
QueueHandle_t xQueue;
QueueHandle_t xStatusQueue;

/**@brief tests the main function
 *
 * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
 */

int main(void)
{
  /* Setup some LEDs for debug Green and Blue on DWM1001-DEV */
  LEDS_CONFIGURE(BSP_LED_0_MASK | BSP_LED_1_MASK | BSP_LED_2_MASK);
  LEDS_OFF(BSP_LED_0_MASK | BSP_LED_1_MASK | BSP_LED_2_MASK );

    /* Create task for movement analyzer set priority to 1 */
    if(xTaskCreate(movementAnalyzer_initiator, "movementAnalyser_INIT", 
                   configMINIMAL_STACK_SIZE+160 , NULL, 1, 
                   &movementAnalyzer_initiator_handler) !=pdPASS) {
      exit(0);  // could not create task, so abort
      }
    if(xTaskCreate(tdmTask, "TDM_INIT", configMINIMAL_STACK_SIZE + 140, NULL,2,NULL) != pdPASS){
      exit(0);
    }
#if DEBUG_MOVEMENTSTATE == 2  
    //IF DEBUG CREATE DEBUGGING TASK
    if(xTaskCreate(test_ss_init_main, "movementAnalyser_TEST", 
                  configMINIMAL_STACK_SIZE+100, NULL, 2, 
                  &test_ss_init_main_handle) !=pdPASS) {
    exit(0);  // could not create task, so abort
    }
 #endif
  //-------------dw1000  ini------------------------------------	

  /* Setup DW1000 IRQ pin */  
  nrf_gpio_cfg_input(DW1000_IRQ, NRF_GPIO_PIN_NOPULL); 		//irq
  

  /*Initialization UART*/
  #if DEBUG_MOVEMENTSTATE == 0 && DEBUG_EVENT == 0
  // danis uart
  uartInit(NRF_UART_BAUDRATE_115200, false);
  #else
  boUART_Init ();
  #endif
  
  /* Reset DW1000 */
  reset_DW1000(); 

  /* Set SPI clock to 2MHz */
  port_set_dw1000_slowrate();
  
  /* Init the DW1000 */
  if (dwt_initialise(DWT_LOADUCODE) == DWT_ERROR)
  {
    //Init of DW1000 Failed
    while (1) {};
  }

  // Set SPI to 8MHz clock
  port_set_dw1000_fastrate();

  /* Configure DW1000. */
  dwt_configure(&config);

  /* Apply default antenna delay value. See NOTE 2 below. */
  dwt_setrxantennadelay((RX_ANT_DLY));
  dwt_settxantennadelay((TX_ANT_DLY));
          
  /* Set expected response's delay and timeout. 
  * As this example only handles one incoming frame with always the same delay and timeout, those values can be set here once for all. */
  dwt_setrxaftertxdelay(POLL_TX_TO_RESP_RX_DLY_UUS);
  //dwt_setrxtimeout(65000); // Maximum value timeout with DW1000 is 65ms SKAL OPSÆTTES SAMMEN FREQUENCY 
  dwt_setrxtimeout(10000); // Maximum value timeout with DW1000 is 10ms MUST BE LOWER THAN TIMESLOT.. 
  
  dwt_seteui((uint8_t*) NRF_FICR->DEVICEID);

  //-------------dw1000  ini------end---------------------------
  //-------------perifials init--------------------------------
    if(!setupTimer()) { 
      exit(EXIT_FAILURE); //couldn't setup timer for ignorelist
    }
   

    if(!setupQueue()) { // couldn't set up queue for tag events
      exit(EXIT_FAILURE);
    }
  //-----timer init end -----
	
    /* Start FreeRTOS scheduler. */
    vTaskStartScheduler();	

    while(1) 
    {};
}

//-----------------------DEBUGGING CODE--------------------------------------
#if DEBUG_MOVEMENTSTATE == 2
static _Bool test_ss_init_main_case(xMessage message) {
      switch(message.event) {
      case  NEW_TAG:
        if(xQueueSend(xQueue,(void *)&message,100) == pdTRUE) {
          return true;
        }
        return false;

      case UPDATE_TAG:
        if(xQueueSend(xQueue,(void *)&message,100) == pdTRUE) {
          return true;
        }
        return false;

      case DELETE_TAG:
        if(xQueueSend(xQueue,(void *)&message,100) == pdTRUE) {
          return true;
        }
        return false;
    }
}

static void test_ss_init_main(void * pvParameter) {
  UNUSED_PARAMETER(pvParameter);
  xMessage message;
  double tof0 =2.70621e-09; 


  while(true) {
    double tof1 =tof0;
    message.event=NEW_TAG;
    message.id=0;
    message.tof = tof0;
    for(int i = 0; i < 5; i++) {
    message.id += 1;
      if(!test_ss_init_main_case(message)) {
        printf("failed to put in queue\r\n");
      }
      vTaskDelay(DEBUG_DELAY);
    }
    message.event=UPDATE_TAG;
    message.id=0;
    for(int i = 0; i < 29; i++) {
    message.id += 1;
    if(message.id == 2) {
      tof1 += 0.6e-09;
      message.tof = tof1;
    }
      if(!test_ss_init_main_case(message)) {
        printf("failed to put in queue\r\n");
      }
      if(i % 3 == 0) {
        message.id = 0;
      }
      message.tof = tof0;
      vTaskDelay(DEBUG_DELAY);
    }

    message.event=DELETE_TAG;
    message.id=0;
    for(int i = 0; i < 5; i++) {
    message.id += 1;
      if(!test_ss_init_main_case(message)) {
        printf("failed to put in queue\r\n");
      }
      vTaskDelay(DEBUG_DELAY);
      }
      printf("test complete!\r\n");
  }
}
#endif