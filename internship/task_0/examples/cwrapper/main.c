/**
 * @file    main.c
 * @brief   Main module code.
 *
 * @addtogroup Main
 * @{
 */

#include <stdint.h>
#include "hitung.h"

/**
 * @brief Main function
 * @return Execution result
 */
int main(int argc, char *argv[]){
    uint16_t hasil;
    hasil = KONSTANTA * fungsiTambah(10, 15);
    printf("contoh hitung: %i", hasil);

    return 0;
}

/** @} */