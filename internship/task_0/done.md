## What Already Done

### Contents
- [Flagship](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#flagship)
	+ [Stetoscope](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#stetoscope)
		* What Worked
		* What Not Worked
		* What Not Tried
	+ Cough Analyzer
	+ IoT Analyzer
- [Audiometri](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/task_0/done.md#audiometri)
	+ Circuit Board
	+ Firmware
	+ Android Interface
	
### Flagship

#### Stetoscope

Current Design Choice

![images](images/stetoscope.png?raw=true)

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

### Audiometri
