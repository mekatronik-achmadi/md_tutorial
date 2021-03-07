# Compiling

## Table of Contents
- [Source Structure](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_compile.md#source-structure)
- [Opening Source](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_compile.md#opening-source)
- [Compiling Source](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_compile.md#compiling-source)
	- [Programming Notepad](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_compile.md#programmer-notepad)
	- [Command Line](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_compile.md#command-line)
- [Binary Result](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_compile.md#binary-result)

## Source Structure

This will explain your source-tree project related to previously downloaded ChibiOS/RT source-tree

In short, your source-tree should look like this:

~~~
Workspace
+-- ChibiOS_STM32
|   +-- demos
|   +-- ext
|   +-- os
|   +-- testhal
|   +-- ...
+-- YourSource
|   +-- chconf.h
|   +-- halconf.h
|   +-- main.c
|   +-- Makefile
|   +-- mcuconf.h
|   +-- ...
+-- PCB
|   +-- kicad.pro
|   +-- kicad.sch
|   +-- kicad.kicad_pcb
|   +-- ...	
~~~

Now, you need to adjust ChibiOS_STM32 folder Unix-path in Makefile.
For example, according structure above, is should be like this:

```make
# Define project name here
PROJECT = bluepill

# Imported source files and paths
CHIBIOS = ../ChibiOS_STM32
```

## Opening Source

To edit/modify source, just open files in your source directory.
Most of the time, you just need open the **Makefile** and you considered opening the project.

![images](images/prjpn.png?raw=true)

![images](images/prjvim.png?raw=true)

## Compiling Source

Generally, compiling source process work by **make** program calling **arm-none-eabi-gcc** by following rules defined in **Makefile**.

### Programmer Notepad

After opening the the **Makefile** you can compile the source from _Tools_ -> _[winAVR] Make All_.

Also to clean up generated files, _Tools_ -> _[winAVR] Make Clean_.

![images](images/compilepn.png?raw=true)

### Command line

Compiling from command-line capability is the reason why we can use any Editor to program.

First, open CMD from menu, the go to the directory where **Makefile** resides.
For example:

~~~
cd C:\Users\win7\Documents\Workspace\rework\
~~~

After you got there, just issue command:

~~~
make
~~~

or to clean up generated files

~~~
make clean
~~~

![images](images/compilecmd.png?raw=true)

For GNU/Linux, just open terminal in source path then issue command **make** or **make clean** like previously.

![images](images/compilesh.png?raw=true)

## Binary result.

If there's no error code and the compilation was successful, you can find a directory named **build**.

In there, you can find file **.bin** and **.hex**. These is file format that commonly flashed to STM32.

Flashing method will be covered in next guide