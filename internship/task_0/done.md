## What Already Done

### Contents
- [Flagship](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#flagship)
	+ [Stetoscope](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#stetoscope)
		+ [Current Design](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#current-design-choice)
		* [What Worked](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#what-worked)
		* [What Not Worked](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#what-not-worked)
		* [What Not Tried](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#what-not-worked)
	+ [Cough Analyzer](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#cough-analyzer)
		* [Current Design](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#current-design-choice-1)
		* [What Worked](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#what-worked-1)
		* [What Not Worked](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#what-not-worked-1)
		* [What Not Tried](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#what-not-tried-1)
		* [Downside Consideration](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#downside-consideration)
- [Audiometri](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#audiometri)
	+ [Circuit Board](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#circuit-board)
	+ [Firmware](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#firmware)
	+ [Android Interface](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#android-interface)
	
### Flagship

#### Stetoscope

##### Current Design Choice

![images](images/stetoscope.png?raw=true)

Actual picture of interface

![images](images/lcdbtgui.jpg?raw=true)

##### What Worked
- Arch Linux ARM (armv6h) setup for RaspberryPi ZeroW. [Markdown Note](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/pizerow.md) and [Package List](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/pkg_basic.txt)
- Python Bluetooth Audio Connect Stack, consist of:
	+ Bluetoothctl from [BlueZ Project](http://www.bluez.org/)
	+ Pulseaudio Audio Server. [Project Web](https://www.freedesktop.org/wiki/Software/PulseAudio/)
	+ Python Wrapper for Bluetoothctl. [Python Module](https://github.com/VibrasticLab/ehealth-iot/blob/master/bttkgui/btctlwrapper.py)
	+ GUI Interface using Tkinter. [Python Script](https://github.com/VibrasticLab/ehealth-iot/blob/master/bttkgui/bttkgui.py)
	
##### What Not Worked
- Python Pexpect not wrapping Bluetoothctl seamlessly
- Fully synchronized command exchange between Bluetoothctl and Pulseaudio
- Audio kernel module (SND_PCM) can not accessed by Pulseaudio

##### What Not Tried
- PCM I2S protocol to SPH0645 or INMP441

#### Cough Analyzer

##### Current Design Choice

![images](images/cough.png?raw=true)

Actual picture of interface

![images](images/lcdcough.jpg?raw=true)

##### What Worked
- Arch Linux ARM (armv7h) setup for RaspberryPi 4. [Markdown Note](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/pi4.md) and [Package List](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/pkg_basic.txt) (plus python-numpy and python-matplotlib)
- Python GUI Interface using Tkinter and Matplotlib. [Python Script](https://github.com/VibrasticLab/ehealth-iot/blob/master/bttkgui/coughgui.py)

##### What Not Worked

None to be found at the moment

##### What Not Tried

Audio Input either using PCM I2S nor Audio USB. Will tried soon

##### Downside Consideration
- RaspberryPi-4 size still bulky
- RaspberryPi-4 need 2A or more current

### Audiometri

#### Circuit Board

Current PCB design can be found [here](https://github.com/VibrasticLab/pikoakustik/tree/stm32f401re_3pin/circuit/test_3rev1).

Written in KiCAD 5x in SMD Layout.

#### Firmware

Written for STM32F401RE using ChibiOS/RT compiled using arm-gcc-none-eabi.

Source tree can be found [here](https://github.com/VibrasticLab/pikoakustik/tree/stm32f401re_3pin/firmware)

#### Android Interface

Written using Flutter and USB_Serial module for Android API Level at least 28.

Source tree can be found [here](https://github.com/VibrasticLab/pikoakustik/tree/stm32f401re_3pin/interface/serialInterface/serIface)
