# Bash Installation

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
    + [Ubuntu/Manjaro](#ubuntumanjaro)
    + [Windows](#windows)
    + [Python on Git Bash](#python-on-git-bash)
    
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

### Python on Git Bash

If you want to run Python interactive shell inside Git Bash, you cannot just run **python** command since it will only return blank lines while the Python program run.

To solve this, either you run Python inside Windows port of pseudoterminal:

```sh
winpty python
```

Or explicitly ask Python to run interactively using flag "-i" (recommended using this way):

```sh
python -i
```

![images](images/bash_windows_python0.png?raw=true)

To exit from Python shell, type **exit()** command.

For non-interactive interpreter (e.g running a Python script), you can run Python program as usual:

![images](images/bash_windows_python1.png?raw=true)