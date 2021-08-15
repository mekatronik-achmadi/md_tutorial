# ESP32 Flashing

## Content
- [Development Board](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#development-board)
- [Changing Mode](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#changing-mode)
	+ [Running](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#running-mode)
	+ [Bootloader](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#bootloader-mode)
- [Flashing](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/esp32_flashing.md#flashing)

## Development Board

For this tutorial, we use NodeMCU ESP32 or similar ESP32-DevKit boards.

![images](images/esp32devkit.png?raw=true)

It's cheap but packed with many features, good for project starter.

![images](images/esp32pinout.png?raw=true)

## Changing Mode

ESP32 has two modes:
- Running Mode
- Programming/Bootloader Mode

### Running Mode

By default, ESP32 board boot to Running Mode after power-up or reset.

To reset into Running Mode, press only EN button

### Bootloader Mode

Bootloader Mode is used to flash program.

To reset Bootloader Mode, press EN button while hold down BOOT button.

**Notes:** In some version, BOOT button labelled as IO0.

## Flashing

Before flashing program to ESP32 board, you need to put ESP32 into Bootloader Mode.

Command to flashing:

```sh
python $IDF_PATH/components/esptool_py/esptool/esptool.py \
--chip esp32 --port /dev/ttyUSB0 --baud 115200 \
--before default_reset --after hard_reset write_flash -z \
--flash_mode dio --flash_freq 40m --flash_size detect 0x10000 \
./build/blinkled.bin
```

The last line is the final binary file name and it's path.

**Note:** Sometimes we need to hold down BOOT/IO0 button to allow flashing process started

![images](images/esp32flash.png?raw=true)

If the process ended successfully, ESP32 will reset and boot into Running Mode automatically