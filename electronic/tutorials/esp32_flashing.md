# ESP32 Flashing

## Content
- [Development Board](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#development-board)
- [Changing Mode](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#changing-mode)
	+ [Running](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#running-mode)
	+ [Bootloader](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#bootloader-mode)
- [Flashing](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#flashing)
	+ [Arch](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#archlinuxmanjaro)
	+ [Windows](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#windows)
- [Bootloader](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#bootloader)

## Development Board

For this tutorial, we use NodeMCU ESP32 or similar ESP32-DevKit boards.

![images](images/esp32devkit.png?raw=true)

It's cheap but packed with many features, good for project starter.

![images](images/esp32pinout.jpg?raw=true)

## Changing Mode

ESP32 has two modes:
- Running Mode
- Programming/Bootloader Mode

### Running Mode

By default, ESP32 board boot to Running Mode after power-up or reset.

To reset into Running Mode, press only EN button

### Bootloader Mode

Bootloader Mode is used to flash program.

To reset into Bootloader Mode, press EN button while hold down BOOT button.

**Notes:** In some version, BOOT button labelled as IO0.

## Flashing

**Note:** We need to hold down BOOT/IO0 button to allow flashing process started.

Once **Connecting...** complete and **Chip is** message shown, you can release BOOT/IO0 button.

### ArchLinux/Manjaro

Simple command to flashing:

```sh
make app-flash
```

![images](images/esp32flash.png?raw=true)

If the process ended successfully, ESP32 will reset into Running Mode automatically

---

### Windows

Before flashing, check the *sdkconfig* file, then change

```
CONFIG_ESPTOOLPY_PORT="/dev/ttyUSB0"
```

to suitable COM port number

```
CONFIG_ESPTOOLPY_PORT="COM1"
```

Then simple command to flashing:

```sh
make app-flash
```

![images](images/esp32win4.PNG?raw=true)

If the process ended successfully, ESP32 will reset into Running Mode automatically

--

## Bootloader

This is the when case you want to replace or restore bootloader included in ESP-IDF (example: after using Arduino app).

First you may need to erase entire flash memory:

```sh
make erase_flash
```

Next make sure target is appropriate in *sdkconfig* file:

```
CONFIG_IDF_TARGET="esp32"
`````` 

Then, write ESP-IDF's bootloader (address 0x1000) using command:

```
make bootloader-flash
```

Next, if you use only single app partition table, make sure it in *sdkconfig* file:

```
CONFIG_PARTITION_TABLE_SINGLE_APP=y
```

Then, write partition table (address 0x8000) using command:

```sh
make partition_table-flash
```

Done. Now you can flash app program like previous.
