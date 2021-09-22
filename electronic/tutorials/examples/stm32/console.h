/**
 * @file    console.h
 * @brief   Console header.
 *
 * @addtogroup Console
 * @{
 */

#ifndef _CONSOLE_H_
#define _CONSOLE_H_

/**
 * @brief Shell thread working area size
 * @details Set to bigger size if necessary
 */
#define SHELL_WA_SIZE   THD_WORKING_AREA_SIZE(2048)

/**
 * @brief Start Shell and UART peripheral
 * @details Serial Interface using UART0 (SD1)
 */
void consoleInit(void);

/**
 * @brief Re-Initialize Shell Thread
 * @details This routine should be called on main thread with some delays
 */
void consoleShell(void);

#endif

/** @} */