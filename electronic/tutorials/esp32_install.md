# ESP32 Programming

## Contents
- [Compiler](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#compiler)
	+ [Arch](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#archlinuxmanjaro)
	+ [Windows](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#windows)
- [USB-TTL Driver](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#usb-ttl-driver)
	+ [Arch](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#archlinuxmanjaro-1)
	+ [Windows](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#windows-1)
- [Libraries](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#libraries)
	+ [ESP-IDF](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#esp-idf)
		- [Arch](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#archlinuxmanjaro-2)
		- [Windows](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#windows-2)
	+ [PyParsing](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#python-pyparsing)
- [Uploader](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#uploader)
- [Editor](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#editor)
	+ [VSCodium](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#vscodium)
	+ [Vim](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#vim)
- [Serial Terminal](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#serial-terminal)
	+ [Moserial](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_install.md#moserial)

## Compiler

For ESP32 compiler we can use XTensa-ESP32-Elf-GCC.

### ArchLinux/Manjaro

You can use this [AUR Package](https://aur.archlinux.org/packages/xtensa-esp32-elf-gcc-bin/).

**Notes:** You need to replace all **python2-** with **python-** at same module dependencies in PKGBUILD.

### Windows

Download the compiler and it's MYSYS2 components package [here](https://dl.espressif.com/dl/esp32_win32_msys2_environment_and_esp2020r2_toolchain-20200601.zip)

Unzip the zip file to *C:*  and it will create an msys32 directory with a pre-prepared environment.
The result should a folder named *C:\msys32*

**Notes:** Avoid any spaces in folders and files name from here and on!!!

Then run program *C:\msys32\mingw32.exe*

The default user home folder will be in *C:\msys32\home*

![images](images/esp32win0.PNG?raw=true)

**Notes**: All shell activity will be done in this terminal window.

## USB-TTL Driver

Depends on kind of development boards used as starting development,
you may need some USB-TTL driver like CH34x, PL230x, CP210x, or FT232x.

### ArchLinux/Manjaro

No need any extra installation since recent kernel already included all of those drivers by default.

### Windows

You can download those drivers here:
- CP210x (try this): [Download](https://drive.google.com/file/d/1EOIDu4Z4NJiLk6UU6dLL4edRn--rqkNG/view?usp=sharing)
- CH34x: [Download](https://drive.google.com/file/d/1-Q9LCqPtK7MlNTnRsnao-CeUexVp9CP1/view?usp=sharing)
- PL230x: [Download](https://drive.google.com/file/d/1TPoFGtD0ngCYNH1h21dQrXWijMSp_XpZ/view?usp=sharing)
- FT232x: [Download](https://www.usb-drivers.org/wp-content/uploads/2014/12/CDM-2.08.28-WHQL-Certified1.zip)

## Libraries

### ESP-IDF

Best library to use is Espressif's ESP-IDF (IoT Development Framework).
It included all essential IoT protocol implementations with multithreading provided by FreeRTOS.

#### ArchLinux/Manjaro

You can use this [AUR Package](https://aur.archlinux.org/packages/esp-idf/)

You need to modify it's PKGBUILD using following details:
- replace all **python2-** with **python-** at same module dependencies
- add "options=(!strip)" for esp-idf
- add "'ccache' 'dfu-util'" as depends
- add "rm -r .git/" before last command line on package()
- add "echo '' | tee requirements.txt" before last command line on package()

ESP-IDF implement Kernel Config interface to customize compilation macros.
For that requirement you may need to install [Python KConfig](https://aur.archlinux.org/packages/python-kconfiglib/)

Lastly, execute this command once to add ESP-IDF to shell path:

```sh
echo 'export IDF_PATH=/opt/esp-idf' >> ~/.bashrc
```

---

#### Windows

First, run program *C:\msys32\mingw32.exe*

Create a folder *esp/* and clone ESP-IDF into it

```sh
mkdir -p ~/esp/;cd ~/esp/
git clone https://github.com/espressif/esp-idf.git
```

![images](images/esp32win1.PNG?raw=true)

then update it's submodule using command:

```sh
cd ~/esp/esp-idf
git submodule update --init
```

Wait for a while until all components downloaded

![images](images/esp32win2.PNG?raw=true)

lastly, run this command to add IDF_PATH in mysys profile

```sh
echo "
export IDF_PATH='$HOME/esp/esp-idf'
" > /etc/profile.d/idf_path.sh
chmod a+x /etc/profile.d/idf_path.sh
```

then exit and re-open terminal like previous.

---

### Python PyParsing

In the linking (ld) process, ESP-IDF employ some python module to parse.
For that requirement, we need PyParsing in a bit older version since latest version break the ESP-IDF API.

#### ArchLinux/Manjaro

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

#### Windows

For Windows, you dont need Python virtual environments since Python in Windows are already has own environments.
All you have to do just install required all Python modules.

```sh
python -m pip install --user -r $IDF_PATH/requirements.txt
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

