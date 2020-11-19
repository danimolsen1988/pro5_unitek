/* UWB microsecond (uus) to device time unit (dtu, around 15.65 ps) conversion factor.
* 1 uus = 512 / 499.2 us and 1 us = 499.2 * 128 dtu. */
#define UUS_TO_DWT_TIME 65536

/* Speed of light in air, in metres per second. */
#define SPEED_OF_LIGHT 299702547

// MOVEMENT TAG STRUCT TO TEST ANALYSIS FUNCTION
#define TAGLISTSIZE 3

void movementAnalyzer_initiator (void * pvParameter);