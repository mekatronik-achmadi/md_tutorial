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
        /**
         * @brief Timer Constant
         */
        uint16_t konstanta = 10;

        /**
         * @brief Minimum function example
         * @details Just simple calculation example
         * @param[in] Uint16 first variable
         * @param[in] Uint16 second variable
         * @return Uint16 result of calculation
         */
        uint16_t fungsiTambah(uint16_t varA, uint16_t varB);

    public:
        /**
        * @brief Class Construtor Function
        */
        Hitung();
};

#endif // _HITUNG_H_
/** @} */