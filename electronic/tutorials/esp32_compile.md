# ESP32 Compiling

## Contents
- [Example Project](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_compile.md#example-project)
- [Source Structure](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_compile.md#source-structure)
- [Opening Source](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_compile.md#opening-source)
- [Compiling Source](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_compile.md#compiling-source)

## Example Project

We will use example provided [here](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_example.md)

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

First, make sure **esp-idf** path is exist using command:

```sh
echo $IDF_PATH
```


To edit/modify source, just open files in your source directory.
Most of the time, you just need open the **Makefile** and you considered opening the project.

![images](images/esp32vim.png?raw=true)

## Compiling Source

Generally, compiling source process work by **make** program calling **xtensa-esp32-elf-gcc** by following rules defined in **Makefile** in Python environment where correct PyParsing installed.

### ArchLinux/Manjaro

First setup (for once) KConfig for project.

```sh
source $HOME/esp32/bin/activate
make menuconfig
```

![images](images/esp32config.png?raw=true)

If you just want default setting, press **S** to save the config.
Then press **Q** to exit config menu.

Before compiling, don't forget to activate Python environment (if not yet activated):

```sh
source $HOME/esp32/bin/activate
```

Now command to compile in a Python environment:

```sh
make -j4 app
```

**Notes**: the option **-j4** means using 4 threads CPU available.

When compiling finish, we get finally binary name (*.bin) ready to upload

![images](images/esp32build.png?raw=true)

Optionally, we can deactivate Python environment (as only needed when compiling) using command:

```sh
deactivate
```

---

### Windows

First setup (for once) KConfig for project.

```sh
make menuconfig
```

![images](images/esp32win4.PNG?raw=true)

If you just want default setting, press **S** to save the config.
Then press **E** to exit config menu.

Now command to compile:

```sh
make -j2 app
```

**Notes**: the option **-j2** means using 4 threads CPU available.

When compiling finish, we get finally binary name (*.bin) ready to upload

**Warning:** There's a chance compile will fail since its toolchain mentioned here still 8.2.0 version for Windows, while for GNU/Linux already in 8.4.0