/*!
* @brief Component name:	uart_fifo
*
* Defines public interface to UART application level driver.
*
* @file uart_fifo.h
*/

#include "nrf_uart.h"

uint32_t uartInit(nrf_uart_baudrate_t baud, bool parity);

uint32_t uartDeinit();

uint32_t uartFlush();

uint32_t uartTransmit(char * data, uint32_t length);