# STM32 Programming

## Table of Contents
- [Compiler]()

## Compiler
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