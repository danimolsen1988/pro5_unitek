#ifndef MOVEMENTANALYZER_H
#define MOVEMENTANALYZER_H

/* UWB microsecond (uus) to device time unit (dtu, around 15.65 ps) conversion factor.
* 1 uus = 512 / 499.2 us and 1 us = 499.2 * 128 dtu. */
#define UUS_TO_DWT_TIME 65536

/* Speed of light in air, in metres per second. */
#define SPEED_OF_LIGHT 299702547

// MOVEMENT TAG STRUCT TO TEST ANALYSIS FUNCTION
#define TAGLISTSIZE 3

//mabye move til uart_fifo.h?
#define WANTSACCESS 0x1010  // uart beskedformat - cmd field.
#define UART_MESSAGE_FORMAT_SIZE 24

/**
* @brief MovementAnalyzer Initiator task entry function.
*
* @param[in] pvParameter   Pointer that will be used as the parameter for the task.
*/
void movementAnalyzer_initiator (void * pvParameter);

#endif