# ESP32 Compiling

## Contents

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

To edit/modify source, just open files in your source directory.
Most of the time, you just need open the **Makefile** or any file you need to edit.

Example opening Makefile in VSCodium:

![images](images/esp32codemk.png?raw=true)

Example opening Makefile in Vim:

![images](images/esp32vim.png?raw=true)

## Compiling Source

Generally, compiling source process work by **make** program calling **xtensa-esp32-elf-gcc** by following rules defined in **Makefile** in Python environment where correct PyParsing installed.

First create default config to disable some certificate bundles

```sh
echo 'CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEFAULT_CMN=y' > sdkconfig.defaults
```

**Notes:** Before compiling, don't forget to activate Python environment (if not yet activated):

```sh
export IDF_PATH='$HOME/esp/esp-idf'
source $HOME/esp32/bin/activate
```

Then setup default KConfig (once each project).

```sh
make defconfig
```

Now command to compile in a Python environment:

```sh
make -j$(nproc) app
```

When compiling finish, we get finally binary name (*.bin) ready to upload

Example on ArchLinux/Manjaro

![images](images/esp32build.png?raw=true)

Example on Windows

![images](images/esp32win3.PNG?raw=true)
