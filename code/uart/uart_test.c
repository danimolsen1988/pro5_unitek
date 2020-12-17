#include <stdio.h>
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"
#include "port_platform.h"
#include "uart_fifo.h"

/* uart message delay period, in milliseconds. */
#define DELAY_MS 1000

/**@brief UART test task entry function.
*
* @param[in] pvParameter   Pointer that will be used as the parameter for the task.
*/
void uart_test_task_function (void * pvParameter)
{
  UNUSED_PARAMETER(pvParameter);

  while (true)
  {
    uart_test_run();
    /* Delay a task for a given number of ticks */
    vTaskDelay(DELAY_MS);
    /* Tasks must be implemented to never return... */
  }
}


int uart_test_run(void)
{
  char * msg = "CM1234\r\n";
  int length = strlen(msg);
  /* Loop forever writing message to uart */
  uartTransmit(msg,length);  
}