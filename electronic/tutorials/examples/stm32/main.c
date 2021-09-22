#include "ch.h"
#include "hal.h"

#include "console.h"

static THD_WORKING_AREA(waThdLed, 128);
static THD_FUNCTION(ThdLed, arg) {
  (void)arg;
  chRegSetThreadName("blinker");

  while(true){
    palClearPad(GPIOA, GPIOA_LED_GREEN);
    chThdSleepMilliseconds(500);

    palSetPad(GPIOA, GPIOA_LED_GREEN);
    chThdSleepMilliseconds(500);
  }
}

int main(void) {
  halInit();
  chSysInit();

  consoleInit();

  chThdCreateStatic(waThdLed, sizeof(waThdLed), NORMALPRIO, ThdLed, NULL);

  while(true){
    consoleShell();
    chThdSleepMicroseconds(500);
  }
}
