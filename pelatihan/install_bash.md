# Bash Installation

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
    + [Ubuntu/Manjaro](#ubuntumanjaro)
    + [Windows](#windows)
    
## Introduction

Bash is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell.
First released in 1989, it has been used as the default login shell for most Linux distributions.

Its pretty much like CMD on MS-DOS/Windows, but POSIX-compliant so make it much more useful than CMD.

## Installation

### Ubuntu/Manjaro

Most GNU/Linux distribution like Debian, Ubuntu, and Manjaro (ArchLinux derivate) already has installed these days.
In fact, Bash even become their default terminal and login shell.

Just open your terminal emulator, it will automatically run as Bash shell.

You can check your shell type using command:

```sh
echo $SHELL
```

You can also check your Bash version using command:

```sh
bash --version
```

![images](images/bash_linux.png?raw=true)

**NOTES:** If your current terminal emulator does not run on Bash (example on Ksh or Zsh), just type **bash** to switch your current shell into Bash shell.

### Windows

If you already install Git for Windows (you can follow [this instruction](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/pelatihan/install_git.md)), you can use Git Bash as your Bash shell.

You can right-click on empty space at Windows Explorer, then click _Git Bash Here_.
You can also start Git Bash from Windows Menu if you dont need any particular path address.

You can test your shell type using command:

```sh
echo $SHELL
```

You can also check your Bash version using command:

```sh
bash --version
```

![images](images/bash_windows.png?raw=true)