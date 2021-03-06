# STM32 Programming

## Table of Contents
- [Compiler](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_install.md#compiler)
- [Windows Driver](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_install.md#windows-driver)
- [Uploader](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_install.md#uploader)
- [Libraries](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/stm32_install.md#libraries)

## Compiler
For compiler, I use GCC-ARM-NONE-EABI as it open-source standard for STM32.
You can download it [here](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads).

**Alternatively**, you can download my [package](https://drive.google.com/file/d/1q520gOruQ-TH--J5tU-m1gB9pVVkQB8W/view?usp=sharing).
With this, all you have to do is extract _gcc-arm-suite_ directory from it to C:\\
and then add it's /bin path (C:\gcc-arm-suite\bin) to Windows's system environment variable.

For Windows-7, right-click _Computer_ on menu -> _Properties_ -> _Advanced System Settings_ -> _Environment Variables_.

On _System Variables_, double-click _Path_, the on variable value add ";C:\gcc-arm-suite\bin" (without quotes and semicolon work as value separator).
Click _OK_ in the end.

![images](images/gccenvar.png?raw=true)

you can test this installation from CMD using:
	
~~~
arm-none-eabi-gcc --version
~~~

![images](images/gccver.JPG?raw=true)

## Windows Driver

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

## Uploader

Uploader software are required to flashing STM32 chip with program we build.
There's two popular way to flashing chip, via SWD and UART Bootloader:

### SWD

Using SWD, you need ST-Link device (preferrably not Chinese clone) connected to STM32's SWDIO, SWCLK, and GND pin.
Install STSW to use ST-Link, you can download from ST's Official Web or get my package [here](https://drive.google.com/file/d/17PP_mZ2qHATJZAJOSbEJMLryBORNO2R2/view?usp=sharing)

**Note**: To run STLinkUtility, you may need Visual C++ Redistributable 32bit (x86). You can get [here](https://aka.ms/vs/16/release/vc_redist.x86.exe).

![images](images/stlink.png?raw=true)

### UART Bootloader

Using Bootloader, you need USB/TTL converter connected to STM32's RX, TX, and GND pin.
You need to reset STM32 into Bootloader mode by putting BOOT0 to Low and BOOT1 to High.
Then back to Run mode by putting BOOT1 to Low after flashing done.
Install USB/TTL driver and Flashloader to use this methode.

You can download Flashloader from web or get my package [here](https://drive.google.com/file/d/16X2A41JwBmAY4dVMn1nfmbGJTxy3zclD/view?usp=sharing).

![images](images/stflash.png?raw=true)

## Libraries

In this project, I prefer to use ChibiOS/RT over ST's FWLib.
Some of reason are:
- Has RTOS kernel integrated on it
- API relatively same across STM32 chip family, also even across other ARM Cortex-M like LPC, NXP, etc.
- I already use it since 2015

I use ChibiOS version 3.0.x.
You can download [here](https://osdn.net/projects/chibios/scm/svn/tree/head/branches/stable_3.0.x/).

**Alternatively** you can get my package [here](https://drive.google.com/file/d/11ivvhc-s3gQD2uzF0HDYm6e5w_w103FT/view?usp=sharing).
It's basically same thing but all platforms other than STM32 already removed.