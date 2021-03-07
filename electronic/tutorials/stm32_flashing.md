# Flashing

## Table of Contents
- [SWD]()

## SWD

SWD (Serial Wire Debug) is a serial communication protocol used for program and debug STM32 chip.
Compared to JTAG (Joint-Test Action) protocol, SWD is subset of it, providing simpler way.

### Requirements

To perform SWD flashing, you need some of these things:
- ST-Link device
  - For Nucleo/Discovery boards, it's already equipped with a ST-Link.
  - For Custom board, you can buy standalone ST-Link device like [this](https://www.aliexpress.com/item/32502417987.html).
  - There is some fake/clone ST-Link like [this](https://www.aliexpress.com/item/1005002072117117.html). Use this only if you really dont have other options.
- ST-Link driver. See installation guide.
- ST-Link interface. See installation guide.

### Pinout

| ST-Link | STM32 | Notes |
|:-------:|:-----:|:-----:|
| VDD | VDD | STLink not providing 3v3 |
| SWCLK | PA14 | Avoid using for GPIO |
| GND | GND | |
| SWDIO | PA13 | Avoid using for GPIO |

### Connect

**Warning**: As STM32 chip will be put under reset, check all other connected device which potentially behave uncontrolably.
Devices like electric motors or it's drivers should turn it off first before put STM32 under reset.

#### Windows

Open _STM32 ST-Link Utility_, then _Target_ -> _Settings_,

From there, make sure:
- _Port_ is set to _SWD_
- _Mode_ is set to _Connect Under Reset_
- _Reset Mode_ is set to _Hardware Reset_

![images](images/st-link0.png?raw=true)

Click _OK_ and ST-Link Utility will show the Flash Memory map contents.

![images](images/st-link1.png?raw=true)

**Notes**: It is possible to connect STM32 without putting the chip under reset.
But it will not give STLink full control of STM32 chip.

#### GNU/Linux

To test connection, you can test reset STM32 Chip using command:

```
sudo st-flash reset 0x8000000
```

![images](images/stflash0.png?raw=true)

### Erasing

Erasing or especially Mass/Full Erasing is way to make sure STM32 chip will not leave any left-over value in it's flash memory.
With this, you can expect STM32 will work as intended.
Futhermore, if you use STM32 Flash as EEPROM, this will reset value of all it's address.

#### Windows

To erase chip, go to _Target_ -> _Erase Chip_, then click _OK_ on confirmation dialog.

STLink Utility then will show all program memory section (0x8000000 and above) become their default value (0xFFFFFFFF).

![images](images/st-link2.png?raw=true)

#### GNU/Linux

To mass erase, use command:

```
sudo st-flash erase
```

![images](images/stflash1.png?raw=true)

### Writing

#### Windows

First you open compilation result file, either Intel Hex (.hex) or Raw Binary (.bin).
Go to _File_ -> _Open file_, then navigate to intended file.

Now STLink Utility will show memory value map of that file in a tab on the right of Devices Memory map tab.

![images](images/st-link3.png?raw=true)

Now, to start program, go to _Target_ -> _Program & Verify_, then Click _Start_ to write to STM32 chip

![images](images/st-link4.png?raw=true)

After that, make sure you see "Verification...OK" on STLink Utility log.

![images](images/st-link5.png?raw=true)

Now you can disconnect the chip using menu _Target_ -> _Disconnect_

#### GNU/Linux

First, open terminal where .bin file reside.
Then use command:

```
sudo st-flash write ./build/*.bin 0x8000000
```

![images](images/stflash2.png?raw=true)

then reset it using previously command:

```
sudo st-flash erase
```

**Note**: If you get verification failure the this,

![images](images/stflash3.png?raw=true)

then you just need to repeat previously write command once again.

## Bootloader

In every STM32 chip, there is a section of memory where a bootloader embedded in it.
This bootloader can used for program the chip using only standard serial communication, mainly UART and I2C protocol.

This guide will explain how to use bootloader to program via UART.

### Requirements

Using bootloader, you need these things:
- USB/TTL-UART converter. You can use converter based on FT232RL, PL2303, or CH34x chip.
For testing this guide, I use PL2303 like [this](https://www.aliexpress.com/item/32850863681.html) as it cheap.
- STM32 Bootloader program. See installation guide

### Pinout

Most of programming bootloader on STM32 use UART1 as default channel.

| PL2303 | STM32 | Notes |
|:-------:|:-----:|:-----:|
| VDD | VDD | 3v3 |
| TX | PA10 | UART1 RX |
| RX | PA9 | UART1 TX |
| GND | GND | |