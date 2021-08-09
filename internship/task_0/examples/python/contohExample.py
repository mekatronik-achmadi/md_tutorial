#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""@package example
Python minimum example
"""

class contohExample():
    """Minimum class example
    """

    ## a Global variable example
    konstanta = 10

    def __init__(self):
        """Minimum init function example
        """
        super(contohExample, self).__init__()

        hasil = self.konstanta * self.fungsiTambah(10,15)
        print("contoh hitung: %i" % hasil)

    def fungsiTambah(self,varA=0,varB=0):
        """Minimum function example
        """

        return varA + varB

if __name__ == "__main__":
    coba = contohExample()
