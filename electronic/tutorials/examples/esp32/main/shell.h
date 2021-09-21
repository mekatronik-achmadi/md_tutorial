/**
 * @file    shell.h
 * @brief   UART Shell header.
 *
 * @addtogroup UART
 * @{
 */


#ifndef _SHELL_H_
#define _SHELL_H_

/**
 * @brief Shell threading Init
 */
void shellInit(void);

/**
 * @brief Shell threading loop
 */
int shellLoop(void);

#endif

/** @} */