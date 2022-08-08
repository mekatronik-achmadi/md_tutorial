# Editor Installation

## Contents
- [Introduction]()
- [Notepad++]()
- [Geany]()
- [VSCodium]()
- [GNU/Linux]()

## Introduction

Text Editor are essential tools to write source code.

Basically you can use any text editor available as long as:
- Has Code/Syntax Highlighting
- Can handle line endings either CR, LF, or CR+LF (Windows)
- Can handle whitespace and indentation consistently
- Support wide range Unicode characters
- Can use fixed-width fonts (e.g Monospace fonts)

You can choose one recommended text editor below as you like.

**NOTES:** Simple Notepad program on Windows should be excluded because can not meet one or two criteria above.

## Notepad++

Notepad++ (NPP) is a lightweight yet powerful text editor available only for Windows.
You can download latest version installer (not the portable one) from [here](https://notepad-plus-plus.org/downloads/).

![images](images/npp.png?raw=true)

## Geany 

Geany is another lightweight yet powerful text editor written in Gtk and available for Windows and Linux.

For Windows, you can download setup program [here](https://www.geany.org/download/releases/)

Also its recommended to also install Geany plugins available there.

For ArchLinux/Manjaro, you can install using command:

```sh
sudo pacman -S geany geany-plugins
```

For Debian/Ubuntu, you can use command:

```sh
sudo apt-get update
sudo apt-get install geany geany-plugins
```

![images](images/geany.png?raw=true)

## VSCodium

VSCodium is open-source version of VSCode (short Visual Studio Code) is an IDE (Integrated Development Environment) program written in Electron Framework and available for Windows and Linux.
It's not considered lightweight editor but packed with powerful features such as Code Completion and wide-range of Extensions.

For Windows, you can download the latest version from its Github release [here](https://github.com/VSCodium/vscodium/releases).

Choose x64 EXE installer or you can click this [version 1.70](https://github.com/VSCodium/vscodium/releases/download/1.70.0/VSCodiumSetup-x64-1.70.0.exe).

![images](images/vscodium.png?raw=true)

For ArchLinux/Manjaro, you can install binary from this [AUR](https://aur.archlinux.org/packages/vscodium-bin).

For Ubuntu, you can install amd64 DEB packge from same Github release [here](https://github.com/VSCodium/vscodium/releases), or download [version 1.70](https://github.com/VSCodium/vscodium/releases/download/1.70.0/codium_1.70.0-1659698816_amd64.deb)

Then install using command:

```sh
sudo dpkg --install codium_*.deb
```






