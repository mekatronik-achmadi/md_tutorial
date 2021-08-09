# Job Assignment

## Contents
- [Basic Standarization](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/jobs.md#basic-standarization)
	+ [Github workflow](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/jobs.md#github-workflow)
	+ [Identifier naming](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/jobs.md#identifier-naming)
	+ [Python language](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/jobs.md#python-language)
		* [Example](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#example)
	+ [C/C++ language](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#cc-language)
		* [Example in C](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/rules.md#example-using-c)
	
## Basic Standarization

### Github workflow

Here some basic rules in working with Github:
- Everyone work in respective Github account.
- Main language for all implementation is Python.
- Work will be merged to main repository in way as:
	+ Github Submodule
	+ Manually apply patch
	+ Pull-Request git patch
- All name for repositories, folder-name, and filename must be:
	+ **NO SPACE !!!**
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

### Identifier naming

Here some basic rules in identifier naming:
- Identifier including names for variables, functions, class, or macros.
- First letter must be lower-case character in **a-z**
- Use underscore if need to separate between words
- Names more than one word must be camel-case, like firstClass, secondFile, thirdFolder, etc
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
- Code Writing using text-editor capable to syntax-highlight and code-completion, like VSCode/VSCodium with Python extension

#### Example

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

### C/C++ Language

Some basic rules if write source in C/C++:
- Good amount documentation either using language's comments or Doxygen formatted.
- Good C/C++ header file using brief function declaration and macros usages.
- Good static and extern variable scope.
- Good pointer/array variable management
- Good amount shell argument input handler.
- Compilable using recent GCC or LLVM toolchain againts open-source libraries.
- Provide build system like Makefile, CMake, AutoMake, QMake, or at least Bash script compilation
- Provide Python wrapper to final binary using subprocess or pexpect module.
- Code Writing using text-editor capable to syntax-highlight and code-completion, like VSCode/VSCodium with clangd extension.

#### Example using C

