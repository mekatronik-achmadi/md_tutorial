# ESP8266 Compiling

## Contents
- [Example Project](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp8266_compile.md#example-project)
- [Source Structure](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp8266_compile.md#source-structure)
- [Opening Source](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp8266_compile.md#opening-source)
- [Compiling Source](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp8266_compile.md#compiling-source)
	+ [Arch](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp8266_compile.md#archlinuxmanjaro)
	+ [Windows](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp8266_compile.md#windows)

## Example Project

We will use example provided [here](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp8266_example.md)

## Source Structure

```
blinkled
+-- main
|   +-- blinkled.c
|   +-- component.mk
|   +-- ...
+-- Makefile
+-- ...
```

You can edit Makefile to change project name (also automatically final binary name).

## Opening Source

To edit/modify source, just open files in your source directory.
Most of the time, you just need open the **Makefile** or any file you need to edit.

Example opening Makefile in VSCodium:

![images](images/esp8266codemk.png?raw=true)

Example opening Makefile in Vim:

![images](images/esp8266vim.png?raw=true)

## Compiling Source

Generally, compiling source process work by **make** program calling **xtensa-esp32-elf-gcc** by following rules defined in **Makefile** in Python environment where correct PyParsing installed.

### ArchLinux/Manjaro

**Notes:** Before compiling, don't forget to set IDF_PATH and activate Python environment:

```sh
export IDF_PATH=/opt/esp8266-rtos
source $HOME/esp8266/bin/activate
```

Then create default KConfig once for each project to generate *sdkconfig* file.

```sh
make defconfig
```

Now command to compile in a Python environment:

```sh
make -j$(nproc) app
```

When compiling finish, we get finally binary name (*.bin) ready to upload

![images](images/esp8266build.png?raw=true)

---

### Windows

**Notes:** Before compiling, don't forget to set IDF_PATH:

```sh
export IDF_PATH=$HOME/esp/ESP8266_RTOS_SDK
```

Then create default KConfig once for each project to generate *sdkconfig* file.

```sh
make defconfig
```

Now command to compile:

```sh
make -j$(nproc) app
```

When compiling finish, we get finally binary name (*.bin) ready to upload

![images](images/esp8266winbuild.PNG?raw=true)
