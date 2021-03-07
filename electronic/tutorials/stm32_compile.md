# Compiling

## Table of Contents
- [Source Structure]()

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
|	+-- ...
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
|   +-- kicad.pcb
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

