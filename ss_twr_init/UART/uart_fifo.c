/*!
* @brief Component name:	uart_fifo
*
* Simple two-wire UART application level driver.
* Provides buffered UART interface
*
* @file uart_fifo.c
*/

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include "app_uart.h"
#include "nrf_uart.h"
#include "boards.h"
#include "app_fifo.h"
#include "nrf_drv_uart.h"
#include "uart_fifo.h"

// UART pins
#define RX_PIN 11
#define TX_PIN 5

// UART circular buffers - Tx and Rx size
#define UART_TX_BUF_SIZE 512
//#define UART_RX_BUF_SIZE 32

//UART Buffers
static app_uart_buffers_t buffers;
//static uint8_t rx_buf[UART_RX_BUF_SIZE];                                                    
static uint8_t txBuf[UART_TX_BUF_SIZE];
//current handles char
static uint8_t tx_buffer[1];


/**< TX FIFO buffer for storing data to be transmitted on the UART when TXD is ready. Data is put to the buffer on using app_uart_put(). */                             
static app_fifo_t txFifo;  

//uart instance
static nrf_drv_uart_t uartInstance = NRF_DRV_UART_INSTANCE(APP_UART_DRIVER_INSTANCE);
                            

//Eventhandler
static void uartEventhandler(nrf_drv_uart_event_t * p_event, void* p_context);
      

uint32_t uartInit(nrf_uart_baudrate_t baud, bool parity){                                  
  buffers.tx_buf = txBuf;                                                              
  buffers.tx_buf_size = sizeof (txBuf);  
  uint32_t errCode;

    // Configure buffer TX buffer.
    errCode = app_fifo_init(&txFifo, buffers.tx_buf, buffers.tx_buf_size);
    if(errCode != NRF_SUCCESS){
      return errCode;
    }    

    nrf_drv_uart_config_t config = NRF_DRV_UART_DEFAULT_CONFIG;
    config.baudrate = (nrf_uart_baudrate_t)NRF_UART_BAUDRATE_115200;
    config.hwfc = NRF_UART_HWFC_DISABLED;
    config.interrupt_priority = APP_IRQ_PRIORITY_LOWEST;
    config.parity = parity ? NRF_UART_PARITY_INCLUDED : NRF_UART_PARITY_EXCLUDED;
    config.pselcts = CTS_PIN_NUM;
    config.pselrts = RTS_PIN_NUM;
    config.pselrxd = RX_PIN;
    config.pseltxd = TX_PIN;

    errCode = nrf_drv_uart_init(&uartInstance, &config, uartEventhandler);
    if(errCode != NRF_SUCCESS){
      return errCode;
    }
    
    return NRF_SUCCESS;
}

uint32_t uartDeinit(){
    nrf_drv_uart_uninit(&uartInstance);
    return NRF_SUCCESS;
}

uint32_t uartFlush(){
    uint32_t errCode;
    errCode = app_fifo_flush(&txFifo);
    return errCode;
}

uint32_t uartTransmit(char * data, uint32_t length){
    uint32_t errCode;
    
    for(int i = 0; i < length; i++){

      errCode = app_fifo_put(&txFifo, data[i]);
      if (errCode == NRF_SUCCESS) {
        // The new byte has been added to FIFO. It will be picked up from there
        // (in 'uartEventhandler') when all preceding bytes are transmitted.
        // But if UART is not transmitting anything at the moment, we must start
        // a new transmission here.
        if (!nrf_drv_uart_tx_in_progress(&uartInstance)) {
            // This operation should be almost always successful, since we've
            // just added a byte to FIFO, but if some bigger delay occurred
            // (some heavy interrupt handler routine has been executed) since
            // that time, FIFO might be empty already.
            if (app_fifo_get(&txFifo, tx_buffer) == NRF_SUCCESS) {
                errCode = nrf_drv_uart_tx(&uartInstance, tx_buffer, 1);
            }
        }
      }else {
        break;
      }    
    } 
    return errCode;
}

static void uartEventhandler(nrf_drv_uart_event_t * p_event, void* p_context) {    
    uint32_t errCode;
    switch (p_event->type) {
        case NRF_DRV_UART_EVT_RX_DONE:
            //no RX
            break;
        case NRF_DRV_UART_EVT_ERROR:            
            //
            break;
        case NRF_DRV_UART_EVT_TX_DONE:
            // Get next byte from FIFO.
            if (app_fifo_get(&txFifo, tx_buffer) == NRF_SUCCESS) {
                (void)nrf_drv_uart_tx(&uartInstance, tx_buffer, 1);
            }
            else {
                // Last byte from FIFO transmitted, notify the application.
            }
            break;
        default:
            break;
    }
}