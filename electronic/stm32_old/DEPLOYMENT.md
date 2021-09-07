# Program Deployment Guide

## Table of Contents
- [Getting Sources](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#getting-sources).
- [Updating Sources](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#updating-sources).
- [Source Structure](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#source-structure).
- [Project Opening](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#project-opening)
  - [QtCreator](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#qtcreator)
  - [Programmer Notepad](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#programmer-notepad)
- [Compiling Source](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#compiling-source)
  - [QtCreator](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#qtcreator-1)
  - [Programmer Notepad](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#programmer-notepad-1)
  - [Direcly in CMD](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#command-line)
- [Binary Result](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/DEPLOYMENT.md#binary-result)

-------------------------------------------------------------------

### Getting Sources

To get sources, you should use Git Clone method over just zip download.

First, right click on empty area in Windows Explorer -> _Git GUI Here_ -> _Clone Existing Repository_

Then fill _Source Location_ with this repo URL and
for _Target Directory_ you can choose wherever you like as long that directory still not created.
Lastly, click _Clone_.

![images](images/gitclone0.png?raw=true)

Wait for a while, then it will finish cloning from internet

![images](images/gitclone1.png?raw=true)

-------------------------------------------------------------------

### Updating Sources

Before able to do source pull, first tell the git who you are.
From _Edit_ -> _Options_, fill Username and Email on _Global (All Repository)_.
Click _Save_ at the end.

![images](images/gitpull0.png?raw=true)

Updating sources from Github using Git GUI consist three steps:
- Fetch using _Remote_ -> _Fetch from_ -> _origin_
- Wait for a while.
- then Merge using _Merge_ -> _Local Merge_

If no any commit conflict or untracked files, the sources should be updated

![images](images/gitpull1.png?raw=true)

-------------------------------------------------------------------

### Source Structure.

The directory where the main sources resides is _rework_ directory.

Before you can compile the sources in there, you need to put ChibiOS/RT library first by extract the downloaded package there.
The sources tree should look like this:

~~~
STM32
+-- cringe-work
+-- guides
+-- rework
|   +-- ChibiOS_STM32
|   |   +-- demos
|   |   +-- ext
|   |   +-- os
|   |   +-- ...
|   +-- rework.creator
|   +-- rework.files
|   +-- rework.includes
|   +-- ...
|   +-- chconf.h
|   +-- halconf.h
|   +-- main.c
|   +-- Makefile
|   +-- mcuconf.h
|   +-- ...
+-- LICENSE
+-- ...
~~~

-------------------------------------------------------------------

### Project Opening

#### QtCreator

The QtCreator project file is a *.creator.
In this case, **rework/rework.creator** is the file.
Just open it from _File_ -> _Open File or Project_ then navigate it to file *.creator.

![images](images/prjqt.png?raw=true)

#### Programmer Notepad

Programmer Notepad usually doesn't use project style.
Just keep open the **Makefile** and you considered opening the project.

![images](images/prjpn.png?raw=true)

-------------------------------------------------------------------

### Compiling Source

Generally, compiling source process work by **make** program calling **arm-none-eabi-gcc** by following rules defined in **Makefile**.

#### QtCreator

After opening the project you can compile the source from _Build_ -> _Build Project "rework"_.

Also to clean up generated files, _Build_ -> _Clean Project "rework"_.

![images](images/compileqt.png?raw=true)

Note: Latest QtCreator seems doesn't really like Linux/Unix path in Windows, so it will give a lot warning about it.
Just ignore them.

#### Programmer Notepad

After opening the the **Makefile** you can compile the source from _Tools_ -> _[winAVR] Make All_.

Also to clean up generated files, _Tools_ -> _[winAVR] Make Clean_.

![images](images/compilepn.png?raw=true)

#### Command line

Compiling from command-line capability is the reason why we can use any Editor to program.

First, open CMD from menu, the go to the directory where **Makefile** resides.
For example:

~~~
cd C:\Users\win7\Documents\STM32\rework
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

-------------------------------------------------------------------

#### Binary result.

If there's no error code and the compilation was successful, you can find a directory named **build**.

In there, you can find file **rework.bin** and **rework.hex**. These is file format that commonly flashed to STM32.

Flashing method will be covered in next guide

