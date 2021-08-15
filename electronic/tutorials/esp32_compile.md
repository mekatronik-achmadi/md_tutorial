# ESP32 Compiling

## Contents
- [Source Structure](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_compile.md#source-structure)
- [Opening Source](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_compile.md#opening-source)
- [Compiling Source](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_compile.md#compiling-source)

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
Most of the time, you just need open the **Makefile** and you considered opening the project.

![images](images/esp32vim.png?raw=true)

## Compiling Source

Generally, compiling source process work by **make** program calling **xtensa-esp32-elf-gcc** by following rules defined in **Makefile** in Python environment where correct PyParsing installed.

First setup KConfig for project:

```sh
source $HOME/esp32/bin/activate
make menuconfig
```

![images](images/esp32config.png?raw=true)

If default accepted, just press **Q** to quit and save default options.

Now command sequence to compile in a Python environment:

```sh
make -j4 app
```

When compiling finish, we get finally binary name (*.bin) ready to upload

![images](images/esp32build.png?raw=true)

Optionally, we can deactivate Python environment (as only needed when compiling) using command:

```
deactivate
```