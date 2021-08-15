# ESP32 Example Project

## Source Structure

```
blinkled
+-- main
|   +-- blinkled.c
|   +-- component.mk
|   +-- ...
+-- Makefile
+-- ...
```

## File Contents

### blinkled.c

```c
#include <stdio.h>

#include "freertos/FreeRTOS.h"
#include "freertos/portmacro.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "sdkconfig.h"

#define BLINK_GPIO  2
#define BLINK_DELAY 200

void hello_task(void *pvParameter){
    while (1) {
        printf("Hello World\n");
        vTaskDelay(5*BLINK_DELAY / portTICK_PERIOD_MS);
    }
}

void app_main(void){
    gpio_reset_pin(BLINK_GPIO);
    gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);

    xTaskCreate(&hello_task, "helloworld", 1024, NULL, 5, NULL);

    while(1){
        gpio_set_level(BLINK_GPIO, 0);
        vTaskDelay(BLINK_DELAY / portTICK_PERIOD_MS);

        gpio_set_level(BLINK_GPIO, 1);
        vTaskDelay(BLINK_DELAY / portTICK_PERIOD_MS);
    }
}
```

### component.mk

```makefile
## Empty
## This is just pseudo-make for file inclusion
```

### Makefile

```makefile
## Makefile for ESP32 using ESP-IDF

PROJECT_NAME := blinkled

include $(IDF_PATH)/make/project.mk
```

