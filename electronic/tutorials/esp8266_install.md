# ESP8266 Programming

## Contents

## Compiler

For ESP8266 compiler we can use XTensa-LX106-Elf-GCC.

### ArchLinux/Manjaro

You can use this [AUR Package](https://aur.archlinux.org/packages/xtensa-lx106-elf-gcc-bin/).

**Notes:** You need to replace all **python2-** with **python-** at same module dependencies in PKGBUILD.

---

### Windows

Download this MSYS2 components package [here](https://dl.espressif.com/dl/esp32_win32_msys2_environment_and_esp2020r2_toolchain-20200601.zip)

**Notes:** This package also will install ESP32 compiler.

Unzip the zip file to *C:*  and it will create an msys32 directory with a pre-prepared environment.

![images](images/esp32win.PNG?raw=true)

The result should a folder named *C:\msys32*

**Notes:** Avoid any spaces in folders and files name from here and on!!!

Next, download the spesific ESP8266 compiler in this [package](https://dl.espressif.com/dl/xtensa-lx106-elf-gcc8_4_0-esp-2020r3-win32.zip)

![images](images/esp8266win.PNG?raw=true)

Unzip this package into *C:\msys32\opt*: 

Then run program *C:\msys32\mingw32.exe*

![images](images/esp32win0.PNG?raw=true)

**Notes**: All shell activity will be done in this terminal window.

Then add ESP8266 compiler path to binary path using command

```sh
echo 'export PATH="/opt/xtensa-lx106-elf/bin:$PATH"' | tee -a ~/.bashrc
```

re-run the program *C:\msys32\mingw32.exe*, then check compiler version using command:

```sh
xtensa-lx106-elf.gcc -v
```

![images](images/esp8266winchk.PNG?raw=true)

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