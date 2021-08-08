# What in Planned

## Contents
- Flagship
	+ Stetoscope
		* Advantage
		* Disadvantage
	+ Cough Analyzer
- Audiometri
	+ Additional LCD
	+ Microphone Input
	+ Android Interface
	
## Flagship

### Stetoscope

New plan for Digital Stetoscope, using embbedded system approach instead microcomputer.

Planned using ESP32 using ESP-IDF operating system

![images](images/stetoscope_new.png?raw=true)

ESP-IDF available in major GNU/Linux distros, for example in Arch Linux can be found [here](https://aur.archlinux.org/packages/esp-idf/)

Just need to found compatible compiler, candidate to try is GCC version released by XTensa themself, like [esp-open-sdk](https://aur.archlinux.org/packages/esp-open-sdk-git/)  

Candidate for A2DP Source using ESP-IDF in source tree [here](https://github.com/pschatzmann/ESP32-A2DP)

#### Advantage

Advantage over using Raspberry:
- Embedded System run much faster and no need booting time
- Less power usage and much better for batterry operated application
- All routines run in one microkernel, no need synchronization between programs
- Bare minimum without bloat programs/features

#### Disadvantage

Disadvantage over using Raspberry:
- Implementation will be in C language, one the most hard to write language
- Can not using known audio bluetooth handler like Pulseaudio and Bluez
- Bluetooth known to need higher interface level to manage discovery, pairing, and connecting.

### Cough Analyzer

There's no new plan. Just continue to adding more feature.

Features list (but not limited) to added:
- Pulseaudio capture from Audio USB or PCM I2S
- Python get audio array from Pulseaudio
- Process Audio Array to determine normal or not.
- Live plot some portion of analysis graph to Tkinter GUI
- Detect bloat feature and make process faster

## Audiometri

### Additional LCD

STM32F401RE has 5 SPI port with 3 of them are capable for PCM I2S.

One of SPI port planned to be used for TFT-LCD ILI9341 or ILI9340 compatible driver (other than port already used for MAX98357A).

### Microphone Input

One other SPI port also planned to used as I2S port for INMP441 or SHP0645 microphone.

### Android Interface 

Improve android interface to be able use Tone Level and Audiogram plots interchangably.

Example of Audiogram:

![images](images/audiogram.png?raw=true)