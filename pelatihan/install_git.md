# Install Git

## Table of Content
- [Introduction](#introduction)
- [Installation](#installation)
- [Create ID](#create-your-id)

## Introduction

Git is software for tracking changes in any set of files,
usually used for coordinating work among programmers collaboratively developing source code during software development.
Its goals include speed, data integrity, and support for distributed,
non-linear workflows (thousands of parallel branches running on different systems).

**NOTES:** Many install process here done in terminal interface requires stable internet connection to check and download required package files.

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
sudo apt-get install git tig
```

For ArchLinux/Manjaro:

```
sudo pacman -S git tig
```

To test installation, type command:

```
git --version
```

![images](images/gitbash.JPG?raw=true)

## Create your ID

Before you proceed any work using git, you have input your name and email as identity.
Issue command like this (Use GitBash in Windows):

```
git config --global user.name "Achmadi"
git config --global user.email "mekatronik.achmadi@gmail.com"
```
