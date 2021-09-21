/**
 * @file    example.c
 * @brief   Main code.
 *
 * @addtogroup Main
 * @{
 */

#include <stdio.h>
#include <string.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "driver/gpio.h"

#include "command.h"
#include "shell.h"

/**
 * @brief Blink gpio pin 
 */
#define BLINK_GPIO  2

/**
 * @brief Blink delay in milliseconds 
 */
#define BLINK_DELAY 100 

/**
 * @brief Led Blink loop function
 */
static void ledTask(void *pvParameter){
    while (1) {
        gpio_set_level(BLINK_GPIO, 0);
        vTaskDelay(BLINK_DELAY / portTICK_PERIOD_MS);

        gpio_set_level(BLINK_GPIO, 1);
        vTaskDelay(BLINK_DELAY / portTICK_PERIOD_MS);
    }
}

/**
 * @brief App Main function
 */
void app_main(void){

    gpio_reset_pin(BLINK_GPIO);
    gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);
    xTaskCreate(&ledTask, "led_task", 1024, NULL, 5, NULL);
    
    shellInit();
    while(1){
        int loop = shellLoop();
        if(loop==1)break;
    }
}

/** @} */