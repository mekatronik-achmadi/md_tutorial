# Basic Rules

## Contents
- [Github workflow](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#github-workflow)
- [Identifier naming](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#identifier-naming)
- [Python language](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#python-language)
	+ [Example](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#example)
- [C/C++ language](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#cc-language)
	+ [Example in C](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#example-using-c)
	+ [Example on C++](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#example-using-c-1)

## Github workflow

Here some basic rules in working with Github:
- Everyone work in respective Github account.
- Main language for all implementation is Python.
- Work will be merged to main repository in way as:
	+ Github Submodule
	+ Manually apply patch
	+ Pull-Request git patch
- All name for repositories, folder-name, and filename must be:
	+ **DO NOT USE SPACE !!!**
	+ First letter must be lower-case character in **a-z**
	+ Use underscore if need to separate between words
	+ Names more than one word must be camel-case, like firstClass, secondFile, thirdFolder, etc
- Source tree preferably like this:
~~~
repository
+-- firstmodule
|   +-- firstclass.py
|   +-- secondclass.py
|   +-- ...
+-- secondmodule
|   +-- main.c
|   +-- Makefile
|   +-- wrapper.py
|   +-- ...	
~~~

## Identifier naming

Here some basic rules in identifier naming:
- Identifier including names for variables, functions, class, or macros.
- First letter must be lower-case character in **a-z**
- Use underscore if need to separate between words
- Names more than one word must be camel-case, like firstClass, secondFile, thirdFolder, etc
- Must briefly indicate what the identifier about, like btStart(), audioStop(), wifiScan(), etc

## Python Language

Some basic rules if write source in Python:
- Good amount documentation either using language's comments or Doxygen formatted.
- Must be written as class module form.
- Optionally has "if main" to test the class.
- Use Python3 shebang and UTF-8 coding in beginning of file
- Has init function without any loop or waiting routine
- Preferably function argument has default value
- Not using any shell argument as class module will be imported programmatically
- Code Writing using text-editor capable to syntax-highlight and code-completion, like VSCode/VSCodium with Python extension

### Example

contohExample.py

~~~python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

class contohExample():
    varGlobal = []

    def __init__(self):
        super(contohExample, self).__init__()

        hasil = self.tambahFungsi(10,15)
        print("contoh hitung: %i" % hasil)

    def tambahFungsi(self,varA=0,varB=0):
        return varA + varB

if __name__ == "__main__":
    coba = contohExample()
~~~

## C/C++ Language

Some basic rules if write source in C/C++:
- Good amount documentation either using language's comments or Doxygen formatted.
- Good C/C++ header file using brief function declaration and macros usages.
- Good static and extern variable scope.
- Good pointer/array variable management
- Preferably has good amount shell argument input handlers.
- Compilable using recent GCC or LLVM toolchain againts open-source libraries.
- Provide build system like Makefile, CMake, AutoMake, QMake, or at least Bash script compilation
- Provide Python wrapper to final binary using subprocess or pexpect module.
- Code Writing using text-editor capable to syntax-highlight and code-completion, like VSCode/VSCodium with clangd extension.

### Example using C

hitung.h, for declaration header

~~~c
/**
 * @file    hitung.h
 * @brief   hitung module header.
 *
 * @addtogroup Main
 * @{
 */

#ifndef _HITUNG_H_
#define _HITUNG_H_

#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

/**
 * @brief Times constant
 */
#define KONSTANTA 10

/**
 * @brief Minimum function example
 * @details Just simple calculation example
 * @param[in] Uint16 first variable
 * @param[in] Uint16 second variable
 * @return Uint16 result of calculation
 */
uint16_t fungsiTambah(uint16_t varA, uint16_t varB);

#endif // _HITUNG_H_
/** @} */
~~~

hitung.c, for implementation of what declared in header

~~~c
/**
 * @file    hitung.c
 * @brief   hitung module code.
 *
 * @addtogroup Main
 * @{
 */

#include "hitung.h"
#include <stdint.h>

uint16_t fungsiTambah(uint16_t varA, uint16_t varB){
    return varA + varB;
}

/** @} */
~~~

main.c, for first function to run

~~~c
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
~~~

Makefile, to compile all above into single binary program

~~~makefile
EXECUTABLE=contohExample

CC=gcc
INCDIR=-I./
CFLAGS=-Wall
LDFLAGS=
LIBFLAGS=

SOURCES=$(wildcard *.c )
OBJECTS=$(SOURCES:.c=.o)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $(EXECUTABLE) $(LIBFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCDIR) -c -o $@ $<

clean:
	rm -f $(EXECUTABLE) $(OBJECTS)
~~~

wrapper.py, to integrate binary into main language (Python)

~~~python
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
~~~

### Example using C++

hitung.h, for declaration header

~~~cpp
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
~~~

hitung.cpp, for implementation of what declared in header

~~~cpp
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
~~~

main.cpp, for first function to run

~~~cpp
/**
 * @file    main.cpp
 * @brief   Main module code.
 *
 * @addtogroup Main
 * @{
 */

 #include "hitung.h"

/**
 * @brief Main function
 * @return Execution result
 */
int main(int argc, char *argv[]){
    Hitung *itung;
    
    itung = new Hitung();

    return 0;
}

/** @} */
~~~

Makefile, to compile all above into single binary program

~~~makefile
EXECUTABLE=contohExample

CC=g++
INCDIR=-I./
CFLAGS=-Wall
LDFLAGS=
LIBFLAGS=

SOURCES=$(wildcard *.cpp)
OBJECTS=$(SOURCES:.c=.o)

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $(EXECUTABLE) $(LIBFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) $(INCDIR) -c -o $@ $<

clean:
	rm -f $(EXECUTABLE) $(OBJECTS)
~~~

wrapper.py, to integrate binary into main language (Python)

Same above wrappe.py actually, but re-paste source hurt no one.

~~~python
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
~~~