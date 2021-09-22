#ifndef _CONSOLE_H_
#define _CONSOLE_H_

/**
 * @brief Shell thread working area size
 * @details Set to bigger size if necessary
 */
#define SHELL_WA_SIZE   THD_WORKING_AREA_SIZE(2048)

void consoleInit(void);
void consoleShell(void);

#endif