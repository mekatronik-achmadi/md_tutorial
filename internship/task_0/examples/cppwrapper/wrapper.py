#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""@package example
Python wrapper example
"""

import subprocess

class contohWrapper():
    """Minimum Wrapper class example
    """

    def __init__(self):
        """Minimum init function example
        """
        super(contohWrapper, self).__init__()

        out = subprocess.run(["./contohExample"],stdout=subprocess.PIPE, stderr=None)
        print(out.stdout.decode('utf-8'))

if __name__ == "__main__":
    coba = contohWrapper()
        