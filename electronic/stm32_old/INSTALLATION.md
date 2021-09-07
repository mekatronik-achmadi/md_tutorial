# Software/Tools Installation Guide

## Table of Contents
- [Alternative Package](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#alternative-package)
- [Source Code Manager](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#source-code-manager)
- [Compiler](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#compiler)
- [Windows Driver](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#windows-driver)
- [Uploader](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#uploader)
  - [SWD](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#swd)
  - [UART](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#uart)
- [Libraries](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#libraries)
- [Editor](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#editor)
  - [QtCreator](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#qtcreator)
  - [Programmer Notepad](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md/#programmers-notepad)
- [Serial Terminal](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#serial-terminal)
  - [Hercules](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#hercules-terminal)
  - [Serial Bluetooth](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#serial-bluetooth)
- [KiCAD](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#kicad)
- [Doxygen](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#doxygen)
- [Download Summary](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/INSTALLATION.md#download-summary)

This is installation guide. You should pay attention in this guide first.
Currently, this guide using Windows-7 as this is OS known to work out of the box (and the only accesible OS by me).
In the future, I will be add Linux like Manjaro or Ubuntu (I use Arch, btw) and I will not cover MacOS as it sucks for programming.

### Alternative Package

I will mention the official or download URL for every software installer/package.
But alternatively, I also prepared some packages that I already tested on my own.
You can found all of it [here](https://drive.google.com/drive/folders/16aN7ICZEpCad6L_2Q1hTNmetX-H0cCP7).
It is previously used for STM32-BluePill training, but it should work for STM32 development in general.

-------------------------------------------------------------------

### Source Code Manager

Source Code Manager or SCM is tool to manage source-tree and as content tracker.
SCM is essential for programming, only psychopath who write code without it.
There are many SCM available such as Git, CVS, Bazaar, etc.

For now, I recommend to use Git as it will easier to use alongside with Github.
You can download Git for windows [here](https://git-scm.com/download/win).
Download **Windows setup** (not the portable package) then install it.

Git SCM will be used as a tool to clone, update, and manage source-code

![images](images/gitk.png?raw=true)

-------------------------------------------------------------------

### Compiler
For compiler, I use GCC-ARM-NONE-EABI as it open-source standard for STM32.
You can download it [here](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads).

**Alternatively**, you can download my [package](https://drive.google.com/file/d/1q520gOruQ-TH--J5tU-m1gB9pVVkQB8W/view?usp=sharing).
With this, all you have to do is extract _gcc-arm-suite_ directory from it to C:\\
and then add it's /bin path (C:\gcc-arm-suite\bin) to Windows's system environment variable.

For Windows-7, R-Click _Computer_ on menu -> _Properties_ -> _Advanced System Settings_ -> _Environment Variables_.

On _System Variables_, double-click _Path_, the on variable value add ";C:\gcc-arm-suite\bin" (without quotes and semicolon work as value separator).
Click _OK_ in the end.

![images](images/gccenvar.png?raw=true)

you can test this installation from CMD using:
~~~
arm-none-eabi-gcc --version
~~~

it will show GCC version like this:

~~~
arm-none-eabi-gcc (Arch Repository) 10.2.0
Copyright (C) 2020 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
~~~

-------------------------------------------------------------------

### Windows Driver

As ST Driver is not included in Windows Installation by default.
I'm not cover driver installation in Windows-8 or above as I dont have access to it.
Here a list of download URL:
- STLink. If you use STLink as program uploader, you can install driver from official ST Webpage (need a free registration).

**Alternatively**, you can download my STLinkUtility package [here](https://drive.google.com/file/d/17PP_mZ2qHATJZAJOSbEJMLryBORNO2R2/view?usp=sharing) (it is also from ST but you can download here without registration).

- USB/TTL. This driver should be installed if you use USB/TTL chip as serial communication.
You can search download URL by your self, but here I provide some (this is tested only on Windows-7):
  - CH34x: [Download](https://drive.google.com/file/d/1-Q9LCqPtK7MlNTnRsnao-CeUexVp9CP1/view?usp=sharing)
  - PL230x: [Download](https://drive.google.com/file/d/1TPoFGtD0ngCYNH1h21dQrXWijMSp_XpZ/view?usp=sharing)
  - FT232x: [Download](https://www.usb-drivers.org/wp-content/uploads/2014/12/CDM-2.08.28-WHQL-Certified1.zip)
- VCP. If you plan to use USB-CDC as Virtual Com Port in STM32, you need to install the ST's VCP driver. You can get my package [here](https://www.usb-drivers.org/wp-content/uploads/2014/12/CDM-2.08.28-WHQL-Certified1.zip).

-------------------------------------------------------------------

### Uploader

Uploader software are required to flashing STM32 chip with program we build.
There's two popular way to flashing chip, via SWD and UART Bootloader:

#### SWD

Using SWD, you need ST-Link device (preferrably not Chinese clone) connected to STM32's SWDIO, SWCLK, and GND pin.
Install STSW to use ST-Link, you can download from ST's Official Web or get my package [here](https://drive.google.com/file/d/17PP_mZ2qHATJZAJOSbEJMLryBORNO2R2/view?usp=sharing)

**Note**: To run STLinkUtility, you may need Visual C++ Redistributable 32bit (x86). You can get [here](https://aka.ms/vs/16/release/vc_redist.x86.exe).

![images](images/stlink.png?raw=true)

#### UART Bootloader

Using Bootloader, you need USB/TTL converter connected to STM32's RX, TX, and GND pin.
You need to reset STM32 into Bootloader mode by putting BOOT0 to Low and BOOT1 to High.
Then back to Run mode by putting BOOT1 to Low after flashing done.
Install USB/TTL driver and Flashloader to use this methode.

You can download Flashloader from web or get my package [here](https://drive.google.com/file/d/16X2A41JwBmAY4dVMn1nfmbGJTxy3zclD/view?usp=sharing).

![images](images/stflash.png?raw=true)

-------------------------------------------------------------------

### Libraries

In this project, I prefer to use ChibiOS/RT over ST's FWLib.
Some of reason are:
- Has RTOS kernel integrated on it
- API relatively same across STM32 chip family, also even across other ARM Cortex-M like LPC, NXP, etc.
- I already use it since 2015

I use ChibiOS version 3.0.x.
You can download [here](https://osdn.net/projects/chibios/scm/svn/tree/head/branches/stable_3.0.x/).
**Alternatively** you can get my package [here](https://drive.google.com/file/d/11ivvhc-s3gQD2uzF0HDYm6e5w_w103FT/view?usp=sharing).
It's basically same thing but all platforms other than STM32 already removed.

-------------------------------------------------------------------

### Editor

Technically you can use any text editor to write code, as long as it has:
- Recognize Unix line ending or even using it by default.
- Syntax Highlighting. Write code without highlighting only for psycho.
- Code Completion. It usefull if you dont want to memorize all keywords

Here some of my recommendations:

#### QtCreator.
It's best C/C++ available now.
Has very good syntax highlighting and codecompletion.
Only downside is it's size almost 300MB for a text editor.
This editor will be used as default project setup.
You can get single installer [here](https://download.qt.io/official_releases/qtcreator/4.14/4.14.0/qt-creator-opensource-windows-x86_64-4.14.0.exe).

Note: If you get annoyed by CLang warnings on editor, you can turn it off from _Help_ -> _About Plugins_ and uncheck _ClangCodeModel_ option.

![images](images/qtcreator.png?raw=true)

#### Programmer's Notepad.
It's a simple source editor.
Has good syntax highlighting.
Only downside is this editor actually from winAVR project, so it still has winAVR brand on it.
If you like lightweight editor or your internet too slow to download QtCreator, I recommend this.

You can get my package [here](https://drive.google.com/file/d/1nmF6X_4iJKNP1QdEUqnjhlbvPfEOGUQz/view?usp=sharing).
Extract it to C:\ (C:\programmer-notepad\) then right-click _programmer-notepad.exe_, choose _Pin to Start Menu_

![images](images/pn.png?raw=true)

### Serial Terminal

If you use some Serial Communication, you may need some Serial Terminal.
You free to choose any Serial Terminal you like, I'm here just giving recommendation:

#### Hercules Terminal

You can get [here](https://www.hw-group.com/files/download/sw/version/hercules_3-2-8.exe).
It's a portable standalone program, no need to install it.

![images](images/serterm.png?raw=true)

#### Serial Bluetooth

This Serial Terminal using Android Bluetooth via bridge module like HC05.
This is avaiable at Play Store under name "Kai Morich Bluetooth Terminal"

![images](images/btterm.png?raw=true)

-------------------------------------------------------------------

### KiCAD

This is not mandatory, but very recommended to use it since professional electronic development
always involved in (at least) reading electronic schematic.

You can choose EAGLE CAD if you like, but I prefer KiCAD since it open-sources and has amazing 3D preview.
Also it's very popular and additional libraries made by communities are very abundances.

You can get KiCAD [here](https://kicad-downloads.s3.cern.ch/windows/stable/kicad-5.1.9_1-x86_64.exe)

Note: Download size almost 1.2GB and Installation size almost 6GB.

![images](images/kicad.png?raw=true)

The circuit 3D viewer is one impressif feature of KiCAD

![images](images/kicad3d.png?raw=true)

-------------------------------------------------------------------

### Doxygen
This is **Optional**.
You don't need doxygen to build or write a STM32 program.
But if you need to generate documentation from source using doxygen comment style, you may install this.
This is just a brief mention, I will not going in depth for now.

You can need install these things:
- Doxygen installer [here](https://doxygen.nl/files/doxygen-1.9.1-setup.exe)
- Graphviz [here](https://gitlab.com/graphviz/graphviz/-/package_files/6164164/download).

After install you need to add their binary paths (C:\Program Files\doxygen\bin\)
to Window's system environment variables (like you did in compiler before).

To build documentation, you can use command like:
~~~
doxygen file_doxyconf.
~~~

It will build documentation in HTML package directly from sources

![images](images/doxy.png?raw=true)

-------------------------------------------------------------------

### Download Summary
- Git SCM: [Download](https://git-scm.com/download/win)
- Compiler gcc-arm-none-eabi:
  - Official: [Download](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
  - Alternative: [Download](https://drive.google.com/file/d/1q520gOruQ-TH--J5tU-m1gB9pVVkQB8W/view?usp=sharing)
- Drivers:
  - STLink+Utility: [Download](https://drive.google.com/file/d/17PP_mZ2qHATJZAJOSbEJMLryBORNO2R2/view?usp=sharing)
  - USB/TTL CH34x: [Download](https://drive.google.com/file/d/1-Q9LCqPtK7MlNTnRsnao-CeUexVp9CP1/view?usp=sharing)
  - USB/TTL PL230x: [Download](https://drive.google.com/file/d/1TPoFGtD0ngCYNH1h21dQrXWijMSp_XpZ/view?usp=sharing)
  - USB/TTL FT232x: [Download](https://www.usb-drivers.org/wp-content/uploads/2014/12/CDM-2.08.28-WHQL-Certified1.zip)
  - USB/TTL VCP: [Download](https://www.usb-drivers.org/wp-content/uploads/2014/12/CDM-2.08.28-WHQL-Certified1.zip)
- Uploader:
  - STLink+Utility: [Download](https://drive.google.com/file/d/17PP_mZ2qHATJZAJOSbEJMLryBORNO2R2/view?usp=sharing)
  - VCRedist x86: [Download](https://aka.ms/vs/16/release/vc_redist.x86.exe)
  - Flashloader: [Download](https://drive.google.com/file/d/16X2A41JwBmAY4dVMn1nfmbGJTxy3zclD/view?usp=sharing)
- ChibiOS/RT Libraries: [Download](https://drive.google.com/file/d/11ivvhc-s3gQD2uzF0HDYm6e5w_w103FT/view?usp=sharing)
- Editor Choice:
  - QtCreator: [Download](https://download.qt.io/official_releases/qtcreator/4.14/4.14.0/qt-creator-opensource-windows-x86_64-4.14.0.exe)
  - Programmer's Notepad: [Download](https://drive.google.com/file/d/1nmF6X_4iJKNP1QdEUqnjhlbvPfEOGUQz/view?usp=sharing)
- KiCAD: [Download](https://kicad-downloads.s3.cern.ch/windows/stable/kicad-5.1.9_1-x86_64.exe)
- Documentation (Optional):
  - Doxygen: [Download](https://doxygen.nl/files/doxygen-1.9.1-setup.exe)
  - Graphviz: [Download](https://gitlab.com/graphviz/graphviz/-/package_files/6164164/download)

