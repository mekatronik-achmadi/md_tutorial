# Job Assignment

## Contents
- Basic Standarization
	+ Github workflow
	+ Identifier naming
	+ Python language
	+ C/C++ language
	
## Basic Standarization

### Github workflow

Here some basic rules in working with Github:
- Everyone work in respective Github account.
- Main Language for all implementation is Python.
- Work will be merged in way as:
	+ Github Submodule
	+ Manually apply patch
	+ Pull-Request git patch
- All name for repositories, folder-name, and filename must be:
	+ **NO SPACE !!!**
	+ First letter must be lower-case character in **a-z**
	+ Use underscore if need to separate between words
	+ Names must be camel-case, like firstClass, secondWord, thirdFolder, etc
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

### Identifier naming

Here some basic rules in identifier naming:
- Identifier including names for variables, functions, class, or macros.
- First letter must be lower-case character in **a-z**
- Use underscore if need to separate between words
- Names must be camel-case, like firstClass, secondFile, thirdFolder, etc
- Must briefly indicate what the identifier about, like btStart(), audioStop(), wifiScan(), etc

### Python Language

Some basic rules if write source in Python:
- Good amount documentation either using language's comments or Doxygen formatted.
- Must be written as class module form.
- Optionally has "if main" to test the class.
- Use Python3 shebang and UTF-8 coding in beginning of file
- Has init function without any loop or waiting routine
- Preferably function argument has default value
- Not using any shell argument as class module will be imported programmatically

Example: contohExample.py

~~~python
#!/usr/bin/env python
# -*- coding: utf-8 -*-

class contohExample():
    varGlobal = []

    def __init__(self):
        super(contohExample, self).__init__()

        hasil = self.tambahFungsi(10,15)
        print("kelas jalan: %i" % hasil)

    def tambahFungsi(self,varA=0,varB=0):
        return varA + varB

if __name__ == "__main__":
    coba = contohExample()
~~~