/**
 * @file    hitung.cpp
 * @brief   hitung module code.
 *
 * @addtogroup Main
 * @{
 */

#include "hitung.h"
#include <cstdint>
#include <iostream>

Hitung::Hitung(){
    uint16_t hasil;
    hasil = Hitung::konstanta * Hitung::fungsiTambah(10,15);
    std::cout << "contoh hitung: " << hasil;
}

uint16_t Hitung::fungsiTambah(uint16_t varA, uint16_t varB){
    return varA + varB;
}

 /** @} */