# Python Installation

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
    + [Ubuntu/Manjaro](#ubuntumanjaro)
    + [Windows](#windows)
        * [Windows 7 Important](#windows-7-important)
        * [Python Installer]()
- [Required Modules]()
    + [Ubuntu/Manjaro]()
    + [Pip]()

## Introduction

Python is a high-level, interpreted, general-purpose programming language.
Its design philosophy emphasizes code readability with the use of significant indentation.

Python is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly procedural), object-oriented and functional programming.
It is often described as a "batteries included" language due to its comprehensive standard library.

## Installation

### Ubuntu/Manjaro

For Python interpreter program (specially version 3), most GNU/Linux distribution like Debian, Ubuntu, and Manjaro (ArchLinux derivate) already has installed these days.

If necessary, you can install using command like this for ArchLinux/Manjaro:

```sh
$ sudo pacman -S python python-pip python-setuptools python-wheel
```

And for Debian/Ubuntu

```sh
$ sudo apt-get update
$ sudo apt-get install python3 python3-pip python3-setuptools python3-wheel
```

**NOTES:** In most GNU/Linux distribution, the **python** interpreter already refers to Python version 3.
But for Debian, Ubuntu, and its derivate, its still stuck as version 2 and for version 3 has to specificly call **python3** program. For convinient accross operating system, its advised to use **python3** everytime call Python interpreters

### Windows

#### Windows 7 Important

If you use earlier Windows 7 (before SP1), you may install KB3063858 update patch:

Here you can download:
- For [64bit](https://www.microsoft.com/en-us/download/details.aspx?id=47442)
- For [32bit](https://www.microsoft.com/en-us/download/details.aspx?id=47409)

If you Windows 7 SP1 onward, or even Windows 8 after, you can ignore this step.

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