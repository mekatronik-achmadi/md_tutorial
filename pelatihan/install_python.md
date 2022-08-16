# Python Installation

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
    + [Ubuntu/Manjaro](#ubuntumanjaro)
    + [Windows](#windows)
        * [Windows 7 Important](#windows-7-important)
        * [Python Installer](#python-installer)
- [Module Installation](#module-installation)
    + [System Package Manager](#system-package-manager)
    + [PIP](#pip)
    + [Minimum Required Modules](#minimum-required-modules)

## Introduction

Python is a high-level, interpreted, general-purpose programming language.
Its design philosophy emphasizes code readability with the use of significant indentation.

Python is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly procedural), object-oriented and functional programming.

**NOTES:** Many install process here done in terminal interface requires stable internet connection to check and download required package files.

## Installation

### Ubuntu/Manjaro

For Python interpreter program (specially version 3), most GNU/Linux distribution like Debian, Ubuntu, and Manjaro (ArchLinux derivate) already has installed these days.

If necessary, you can install using command like this for ArchLinux/Manjaro in your terminal emulator:

```sh
sudo pacman -S python python-pip python-setuptools python-wheel
```

And for Debian/Ubuntu

```sh
sudo apt-get update
sudo apt-get install python3 python3-pip python3-setuptools python3-wheel
```

**NOTES:** In most GNU/Linux distribution, the **python** interpreter already refers to Python version 3.
But for Debian, Ubuntu, and its derivate, its still stuck as version 2 and for version 3 has to specificly call **python3** program. For convinient accross operating system, its advised to use **python3** everytime call Python interpreters

To check installed version, type this command on your terminal emulator:

```sh
python3 -V
```

### Windows

#### Windows 7 Important

If you use earlier Windows 7 (before SP1), you may install KB3063858 update patch:

Here you can download:
- For [64bit](https://www.microsoft.com/en-us/download/details.aspx?id=47442)
- For [32bit](https://www.microsoft.com/en-us/download/details.aspx?id=47409)

If you use Windows 7 SP1 onward, or even Windows 8 after, you can ignore this step.

#### Python Installer

Next, you need download Python installer from [here](https://www.python.org/downloads/release/python-3106/).

Choose **Windows installer (64-bit)** for 64 version of Windows and vice-versa.

![images](images/python_win_installer.png?raw=true)

**NOTES:** Most recent Python for Windows cannot be installed on Windows 7 or ealier version of Windows.
At the time this tutorial written, the last version available for Windows 7 is Python version 3.8.10.
You can visit [here](https://www.python.org/downloads/release/python-3810/).

Check **Add Python to PATH**, then click **Install Now**

![images](images/python_win_install.png?raw=true)

Wait until success

![images](images/python_win_install_success.png?raw=true)

Close the installer, then open command prompt using Win+R, type **cmd**, then Enter.
Then type this to check version:

```sh
python -V
```

![images](images/python_win_chkver.png?raw=true)

## Module Installation

Python interpreter will do much without additional modules.
Here an example to install NumPy (module to handle advance number task) using two different approach

### System Package Manager

Many GNU/Linux distribution operating system had their own internal package manager system.
If you use GNU/Linux, it is preferable to use system package manager instead Python itself.
That way, upgrading operating system will be more integrated since Python can be part of operating system internal mechanism.

Example to install Numpy on ArchLinux/Manjaro:

```sh
sudo pacman -S python-numpy
```

Example for Debian/Ubuntu:

```sh
sudo apt-get update
sudo apt-get install python3-numpy
```

After success, open your terminal emulator, and enter **python** shell.
Then type enter command:

```py
import numpy
```

![images](images/python_numpy_linux.png?raw=true)

If no error message like above, meaning NumPy installation was successful.

To exit from Python shell, type **exit()** command or press CTRL+D

### PIP

PIP (short for Package Installer for Python) is Python's internal package management system.
Written in Python and designed to be operating system independent so it can be used same way across major operating system like Windows and GNU/Linux.

Here an example to install NumPy on Python run on Windows using PIP.

First open **cmd** window like previous, then type command:

```sh
pip install numpy
```

![images](images/python_numpy_win0.png?raw=true)

To test NumPy installation, close previous cmd window and open new cmd window.
Then type command:

```py
import numpy
```

![images](images/python_numpy_win1.png?raw=true)

If no error message like above, meaning NumPy installation was successful.

To exit from Python shell, type **exit()** command or press CTRL+Z and Enter.

### Minimum Required Modules

Here list of minimum required modules:
- numpy
- scipy
- pandas
- matplotlib
- scikit-learn
- ipython
- jupyter

