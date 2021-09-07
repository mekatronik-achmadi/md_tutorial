# Program Flashing Guide

## Table of Contents
- [SWD](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#swd)
  - [Requirements](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#requirements)
  - [Pinout](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#pinout)
  - [Connect](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#connect)
  - [Erasing](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#erasing)
  - [Writing](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#writing)
- [Bootloader](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#bootloader)
  - [Requirements](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#requirements-1)
  - [Pinout](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#pinout-1)
  - [Chip Mode](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#chip-mode)
  - [Connect](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#connect-1)
  - [Erasing](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#erasing-1)
  - [Writing](https://github.com/mekatronik-achmadi/vandi_stm32/blob/main/guides/FLASHING.md#writing-1)

-------------------------------------------------------------------

### SWD

SWD (Serial Wire Debug) is a serial communication protocol used for program and debug STM32 chip.
Compared to JTAG (Joint-Test Action) protocol, SWD is subset of it, providing simpler way.

#### Requirements

To perform SWD flashing, you need some of these things:
- ST-Link device
  - For Nucleo/Discovery boards, it's already equipped with a ST-Link.
  - For Custom board, you can buy standalone ST-Link device like [this](https://www.aliexpress.com/item/32502417987.html).
  - There is some fake/clone ST-Link like [this](https://www.aliexpress.com/item/1005002072117117.html). Use this only if you really dont have other options.
- ST-Link driver. See installation guide
- ST-Link interface. They are two kinds available:
  - Open Source kind. For Linux/BSD, this is recommended. See yourself [here](https://github.com/stlink-org/stlink).
  - Official kind. Recommended for Windows. See installation guide. This guide will focus in this kind.

-------------------------------------------------------------------

#### Pinout

| ST-Link | STM32 | Notes |
|:-------:|:-----:|:-----:|
| VDD | VDD | STLink not providing 3v3 |
| SWCLK | PA14 | Avoid using for GPIO |
| GND | GND | |
| SWDIO | PA13 | Avoid using for GPIO |

-------------------------------------------------------------------

#### Connect

**Warning**: As STM32 chip will be put under reset, check all other connected device which potentially behave uncontrolably.
Devices like electric motors or it's drivers should turn it off first before put STM32 under reset.

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

-------------------------------------------------------------------

#### Erasing

Erasing or especially Mass/Full Erasing is way to make sure STM32 chip will not leave any left-over value in it's flash memory.
With this, you can expect STM32 will work as intended.
Futhermore, if you use STM32 Flash as EEPROM, this will reset value of all it's address.

To erase chip, go to _Target_ -> _Erase Chip_, then click _OK_ on confirmation dialog.

STLink Utility then will show all program memory section (0x8000000 and above) become their default value (0xFFFFFFFF).

![images](images/st-link2.png?raw=true)

-------------------------------------------------------------------

#### Writing

First you open compilation result file, either Intel Hex (.hex) or Raw Binary (.bin).
Go to _File_ -> _Open file_, then navigate to intended file.

Now STLink Utility will show memory value map of that file in a tab on the right of Devices Memory map tab.

![images](images/st-link3.png?raw=true)

Now, to start program, go to _Target_ -> _Program & Verify_, then Click _Start_ to write to STM32 chip

![images](images/st-link4.png?raw=true)

After that, make sure you see "Verification...OK" on STLink Utility log.

![images](images/st-link5.png?raw=true)

Now you can disconnect the chip using menu _Target_ -> _Disconnect_

-------------------------------------------------------------------

### Bootloader

In every STM32 chip, there is a section of memory where a bootloader embedded in it.
This bootloader can used for program the chip using only standard serial communication, mainly UART and I2C protocol.
This guide will explain how to use bootloader to program via UART.

#### Requirements

Using bootloader, you need these things:
- USB/TTL-UART converter. You can use converter based on FT232RL, PL2303, or CH34x chip.
For testing this guide, I use PL2303 like [this](https://www.aliexpress.com/item/32850863681.html) as it cheap.
- STM32 Bootloader program. They are two kinds available:
  - Open Source kind. For Linux/BSD, this is recommended. See yourself [here](https://sourceforge.net/projects/stm32flash/).
  - Official kind. Recommended for Windows. See installation guide. This guide will focus in this kind.

-------------------------------------------------------------------

#### Pinout

Most of programming bootloader on STM32 use UART1 as default channel.

| PL2303 | STM32 | Notes |
|:-------:|:-----:|:-----:|
| VDD | VDD | 3v3 |
| TX | PA10 | UART1 RX |
| RX | PA9 | UART1 TX |
| GND | GND | |

-------------------------------------------------------------------

#### Chip Mode

Each after reset or re-power, STM32 will boot into different modes based on BOOT0 and BOOT1 state.

| Modes | BOOT0 | BOOT1 |
|:-----:|:-----:|:-----:|
| Running | 0 | 0 |
| Bootloader | 1 | 0 |

The 0 value means 0v or GND and the 1 value means 3v3 or VDD.

So, to change boot modes, just set STM32 BOOT pins according table above and then reset/re-power

-------------------------------------------------------------------

#### Connect

**Warning**: As STM32 chip will be put under reset, check all other connected device which potentially behave uncontrolably.
Devices like electric motors or it's drivers should turn it off first before put STM32 under reset.

First, Open Windows _Device Manager_ to check on which number COM Port registered.

![images](images/stboot0.png?raw=true)

Now, open _Demonstrator GUI_ from Windows menu, then make sure the _Port Name_ is match.

![images](images/stboot1.png?raw=true)

Before click _Next_, make sure the STM32 chip **already** booted into bootloader.
Otherwise, it will make this program freeze.

After click _Next_, you will see message that chip is readable

![images](images/stboot2.png?raw=true)

Then just click _Next_ a couple time, until you this main page:

![images](images/stboot3.png?raw=true)

-------------------------------------------------------------------

#### Erasing

To perform Mass/Full Erase, choose _Erase_ and _All_,

![images](images/stboot3b.png?raw=true)

Then click _Next_ and wait until you see this page.

![images](images/stboot4.png?raw=true)

**Warning**: if your next action is to write program, dont click _Back_.
But Click _Close_ and start the connecting process from start (including resetting STM32 chip).

-------------------------------------------------------------------

#### Writing

To perform writing, choose _Download to Devices_

The to open compilation result file, click three dotted button right on file name bar.
On file selection dialog, use either _hex Files_ or _bin Files_ as file format.

For erase option, I recommend _Global Erase_

Lastly, dont forget to check _Verify after download_

![images](images/stboot5.png?raw=true)

Now, you can click _Next_ and chip programming will started.

![images](images/stboot6.png?raw=true)

Make sure verification is success in the end.

![images](images/stboot7.png?raw=true)

Now you can _Close_ and change the chip STM32 to boot into Running mode.
