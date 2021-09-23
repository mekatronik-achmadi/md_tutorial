# STM32 Example Project

## Pre-Requisities

This example explanation use ChibiOS/RT package prepared by us.
You can download the package [here](https://drive.google.com/file/d/11ivvhc-s3gQD2uzF0HDYm6e5w_w103FT/view?usp=sharing).

## Getting Examples

You can also find some official HAL examples brought by ChibiOS/RT package in directory *ChibiOS_STM32/demos/*.
Those examples grouped in each directory based on STM32 board known today.

You can also find some official HAL examples brought by ChibiOS/RT package in directory *ChibiOS_STM32/testhal/STM32/*.
Those examples grouped in each directory based on STM32 chip families.

If you use board STM32-BluePill, we provides some example spesific for this board in directory *ChibiOS_STM32/example/*

Below we will provide a minimal example of Blink LED example for NUCLEO-F401 board included in package.

Other example that combined with Serial Shell can be found [here](https://github.com/mekatronik-achmadi/md_tutorial/tree/master/electronic/tutorials/examples/stm32).

## Source Structure

For this examples, your source tree should looks like this:

```
Workspace
+-- ChibiOS_STM32
|   +-- demos
|   |   +-- STM32
|   |	|   +-- RT-STM32F401RE-NUCLEO
|   |   |   |   +-- chconf.h
|   |   |   |   +-- halconf.h
|   |   |   |   +-- main.c
|   |   |   |   +-- Makefile
|   |   |   |   +-- mcuconf.h
|   +-- ext
|   +-- os
|   +-- test
|   +-- testhal
```

**Notes:** This different then the other example since this is spesificly only for NUCLEO-F401 board,
while the other is for general purpose.
 
## File Contents

While you can use the example right away, here we will adjust the example to just doing Blink LED without any extras

### halconf.h

This file control what feature activated and compiled into binary

Disable SERIAL in line 135, by change:

```c
#define HAL_USE_SERIAL              TRUE
```

to:

```c
#define HAL_USE_SERIAL              FALSE
```


---

### mcuconf.h

This file control spesific configurations defined in halconf.h following each chips.

Here need to disable:
- SERIAL-2 in line 169, by change:

```c
#define STM32_SERIAL_USE_USART2             TRUE
```

to:

```c
#define STM32_SERIAL_USE_USART2             FALSE
```

- SPI-1 and SPI-2 in line 178-179, by change:

```c
#define STM32_SPI_USE_SPI1                  TRUE
#define STM32_SPI_USE_SPI2                  TRUE
```

to 

```c
#define STM32_SPI_USE_SPI1                  FALSE
#define STM32_SPI_USE_SPI2                  FALSE
```

---

### Makefile

This file control compilation process.

Make sure the CHIBIOS variable point to valid ChibiOS/RT source-tree

```
CHIBIOS = ../../..
```

or if in separate folder

```
CHIBIOS = /opt/stm32chlib/chibios30
```

Also if you want speed up building by disabling test function, you can comment

```
include $(CHIBIOS)/test/rt/test.mk
```

to

```
#include $(CHIBIOS)/test/rt/test.mk
```

**Tips**: You may want to disable Link Time Optimization (LTO) as not GCC version support it by changing

```
USE_LTO = yes
```

to

```
USE_LTO = no
```

---

### main.c

Replace this file using content below to just doing Blink LED in a threadloop outside main threadloop

```c
#include "ch.h"
#include "hal.h"

static THD_WORKING_AREA(waThread1, 128);
static THD_FUNCTION(Thread1, arg) {
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
  chThdCreateStatic(waThread1, sizeof(waThread1), NORMALPRIO, Thread1, NULL);

  while(true){
    chThdSleepMicroseconds(500);
  }
}
```