# Git

## Table Of Content
- [Introduction](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#introduction)
- [Installation](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#installation)

## Introduction

Git is software for tracking changes in any set of files,
usually used for coordinating work among programmers collaboratively developing source code during software development.
Its goals include speed, data integrity, and support for distributed,
non-linear workflows (thousands of parallel branches running on different systems).

## Installation

For Windows, you can download [here](https://git-scm.com/download/win).
Download the **Windows setup** (not the portable package) then install it (use default setting).

After installation, you can right-click on empty space at explorer, then click _Git Bash Here_.

For Debian/Ubuntu:

```
sudo apt-get install git
```

For ArchLinux/Manjaro:

```
sudo pacman -S git
```

To test installation, type command:

```
git --version
```

![images](images/gitbash.jpg?raw=true)

## Create Git Directory

To create a new Git directory, create a new folder where all your project files reside.
Then open Git Bash there and type command:

```
git init
``` 

It will create a hidden _.git_ folder and initialize a new empty git repository in that folder.


```
$> Initialized empty Git repository in /home/achmaday/Desktop/TutorialTest/.git/
```

## Add Untracked Files

By default, when you create a new files, it is not automatically add to tracked files.
Git will not track any changes or modification on untracked files.

For example, you create a new file named _main.c_ with this content:

```c
#include <stdio.c>

int main(void){
	return 0;
}
```
