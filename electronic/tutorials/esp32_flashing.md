# ESP32 Flashing

## Content
- [Development Board](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#development-board)
- [Changing Mode](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#changing-mode)
	+ [Running](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#running-mode)
	+ [Bootloader](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#bootloader-mode)
- [Flashing](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#flashing)
	+ [Arch]()
	+ [Windows]()
- [Bootloader]()

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

Example command to flashing:

```sh
python $IDF_PATH/components/esptool_py/esptool/esptool.py \
--chip esp32 --port /dev/ttyUSB0 --baud 115200 \
--before default_reset --after hard_reset write_flash -z \
--flash_mode dio --flash_freq 40m --flash_size detect 0x10000 \
./build/blinkled.bin
```

The last line is the final binary file name and it's path.

![images](images/esp32flash.png?raw=true)

If the process ended successfully, ESP32 will reset into Running Mode automatically

---

### Windows

Example command to flashing:

```sh
python3 $IDF_PATH/components/esptool_py/esptool/esptool.py \
--chip esp32 --port COM3 --baud 115200 \
--before default_reset --after hard_reset write_flash -z \
--flash_mode dio --flash_freq 40m --flash_size detect 0x10000 \
./build/blinkled.bin
```

The last line is the final binary file name and it's path.

**Tips:** The difference between GNU/Linux and Windows command actually just **--port** option, where **/dev/ttyUSBx** for GNU/Linux while **COMx** for Windows.

![images](images/esp32win5.PNG?raw=true)

If the process ended successfully, ESP32 will reset into Running Mode automatically

---

## Bootloader

In case you want to replace or restore bootloader included in ESP-IDF, first you may need to erase entire flash memory:

```sh
make erase_flash
```

Next make sure target is appropriate in *sdkconfig* file:

```
CONFIG_IDF_TARGET="esp32"
``` 

then, write ESP-IDF's bootloader using command:

```
make bootloader-flash
```

Next, if you use only single app partition table, make sure it in *sdkconfig* file:

```
CONFIG_PARTITION_TABLE_SINGLE_APP=y
CONFIG_PARTITION_TABLE_OFFSET=0x8000
```

then, write partition table using command:

```sh
make partition_table-flash
```

Done. Now you can flash app program like previous.
