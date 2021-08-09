/**
 * @file    hitung.h
 * @brief   hitung module header.
 *
 * @addtogroup Main
 * @{
 */

#ifndef _HITUNG_H_
#define _HITUNG_H_

#include <cstdint>
#include <iostream>

class Hitung{
    private:
        uint16_t konstanta = 10;
        uint16_t fungsiTambah(uint16_t varA, uint16_t varB);

    public:
        Hitung();
};

#endif // _HITUNG_H_
/** @} */