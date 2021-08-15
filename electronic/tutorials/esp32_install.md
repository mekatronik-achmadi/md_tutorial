# ESP32 Programming

## Contents
- [Compiler](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#compiler)
- [USB-TTL Driver]()
- [Libraries]()
	+ [ESP-IDF]()
	+ [PyParsing]()

## Compiler

For now, this entire tutorial intended for Arch Linux and it's derivatives.
For other GNU/Linux distros like Ubuntu will written soon.
For Windows like will need more time.

For ESP32 we can use XTensa-ESP32-Elf-GCC.

To install in Arch Linux, you can use this [AUR Package](https://aur.archlinux.org/packages/xtensa-esp32-elf-gcc-bin/)

**Notes:** You need to replace all **python2-** with **python-** at same module dependencies in PKGBUILD.

## USB-TTL Driver

Depends on kind of development boards used as starting development.

You may need some USB-TTL driver for GNU/Linux like CH34x, PL230x, CP210x, or FT232x.

**Fortunately**, recent kernel already included all of those drivers by default.
Just use latest Arch Linux default kernel and those drivers will just run.

## Libraries

### ESP-IDF

Best library to use is Espressif's ESP-IDF (IoT Development Framework).
It included all essential IoT protocol implementations with multithreading provided by FreeRTOS.

To install in Arch Linux, you can use this [AUR Package](https://aur.archlinux.org/packages/esp-idf/)

You need to modify it's PKGBUILD using following details:
- replace all **python2-** with **python-** at same module dependencies
- add "options=(!strip)" for esp-idf
- add "'ccache' 'dfu-util'" as depends
- add "rm -r .git/" before last command line on package()
- add "echo '' | tee requirements.txt" before last command line on package()

ESP-IDF implement Kernel Config interface to customize compilation macros.
For that requirement you may need to install [Python KConfig](https://aur.archlinux.org/packages/python-kconfiglib/)

Lastly,, execute this command once to add ESP-IDF to shell path:

```sh
echo 'export IDF_PATH=/opt/esp-idf' >> ~/.bashrc
```

### Python PyParsing

In the linking (ld) process, ESP-IDF employ some python module to parse.
For that requirement, we need PyParsing in a bit older version since latest version break the ESP-IDF API.

Follow these commands to install PyParsing 2.2.0 in a virtual enviroment:

```sh
cd $HOME;
virtualenv esp32 --system-site-packages
```

to test installation

```sh
source ~/esp32/bin/activate
pip install pyparsing==2.2.0
deactivate
```