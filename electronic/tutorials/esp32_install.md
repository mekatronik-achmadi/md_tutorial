# ESP32 Programming

## Contents
- [Compiler](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#compiler)
- [USB-TTL Driver](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#usb-ttl-driver)
- [Libraries](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#libraries)
	+ [ESP-IDF](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#esp-idf)
	+ [PyParsing](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#python-pyparsing)
- [Uploader](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#uploader)
- [Editor](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#editor)
	+ [VSCodium](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#vscodium)
	+ [Vim](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#vim)
- [Serial Terminal](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#serial-terminal)
	+ [Moserial](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#moserial)

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
cd $HOME
virtualenv esp32 --system-site-packages

source $HOME/esp32/bin/activate
pip install pyparsing==2.2.0
deactivate
```

to test installation

```sh
source ~/esp32/bin/activate
python -c "import pyparsing;print(pyparsing.__version__)"
deactivate
```

## Uploader

For uploader program, we can use ESPTool installed as part of ESP-IDF.

You can check the version using command:

```sh
source $HOME/esp32/bin/activate
python $IDF_PATH/components/esptool_py/esptool/esptool.py version
deactivate
```

## Editor

Technically you can use any text editor to write code, as long as it has:
- Recognize Unix line ending or even using it by default.
- Syntax Highlighting. Write code without highlighting only for psycho.
- Code Completion. It usefull if you dont want to memorize all keywords

Here some of my recommendations:

### VSCodium

VSCodium is a community-driven version of Visual Studio Code (VSCode).
It's build from same source but with all Microsoft touch disabled.

It's a complete source editor.
Has good syntax highlighting.
The downside is since written in electron, it would probably take a lot of memory.
Especially in Windows with a lot extension.

For ArchLinux/Manjaro, to install VSCodium binary from this [AUR](https://aur.archlinux.org/packages/vscodium-bin/).

![images](images/esp32codium.png?raw=true)

### Vim

Lets face it, this text editor is powerful, but not for beginner.
I mention it here only because it is an awesome editor.

If you interested, see it yourself [here](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/vim.md)

![images](images/esp32code.png?raw=true)

## Serial Terminal

### Moserial 

A Serial Terminal using GTK+ Toolkit.

To install in ArchLinux/Manjaro:

```sh
sudo pacman -S moserial
```

![images](images/moserial.png?raw=true)

