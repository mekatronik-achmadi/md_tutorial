/**
 * @file    console.c
 * @brief   Console code.
 *
 * @addtogroup Console
 * @{
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ch.h"
#include "hal.h"
#include "shell.h"
#include "chprintf.h"

#include "console.h"

/**
 * @brief Shell Console pointer
 */
static thread_t *shelltp = NULL;

/**
 * @brief Test command callback
 * @details Enumerated and not called directly by any normal thread
 */
static void cmd_coba(BaseSequentialStream *chp, int argc, char *argv[]){
    (void)argc;
    (void)argv;

    if (argc > 0) {
      chprintf(chp, "Usage: coba\r\n");
      return;
    }
    chprintf(chp,"Serial Console at %d & buffer size %d bit\r\n",SERIAL_DEFAULT_BITRATE,SERIAL_BUFFERS_SIZE);
}

/**
 * @brief Shell command and it's callback enumeration
 * @details Extending from internal shell's callback
 */
static const ShellCommand commands[] = {
    {"coba",cmd_coba},
    {NULL, NULL}
};

/**
 * @brief Shell Driver Config
 * @details Serial Interface using UART1 (SD1)
 */
static const ShellConfig shell_cfg = {
  (BaseSequentialStream *)&SD1,
  commands
};

void consoleInit(void){
    palSetPadMode(GPIOA,  9, PAL_MODE_ALTERNATE(7)); //TX
    palSetPadMode(GPIOA, 10, PAL_MODE_ALTERNATE(7)); //RX
    
    sdStart(&SD1,NULL);
    shellInit();
}

void consoleShell(void){
    if (!shelltp) {
        shelltp = shellCreate(&shell_cfg, SHELL_WA_SIZE, NORMALPRIO);
    }
    else {
        if (chThdTerminatedX(shelltp)) {
            chThdRelease(shelltp);
            shelltp = NULL;
        }
    }
}

/** @} */