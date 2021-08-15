# ESP32 Flashing

## Content
- [Development Board]()
- [Changing Mode]()
- [Flashing]()

## Development Board

For this tutorial, we use NodeMCU ESP32 or similar ESP32-DevKit boards.

![images](images/esp32devkit.png?raw=true)

It's cheap and packed with many features, good for project starter.

## Changing Mode

ESP32 has two modes:
- Running Mode
- Programming/Bootloader Mode

### Running Mode

By default, ESP32 board boot to Running Mode after power-up or reset.

To reset into Running Mode, press only EN button

### Bootloader Mode

Bootloader Mode is used to flash program.

To enter Bootloader Mode, press EN button while hold down BOOT button.

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

If the process ended successfull, ESP32 will reset and boot into Running Mode