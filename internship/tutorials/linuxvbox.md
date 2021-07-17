# Linux on VBox

## Table of Contents
- [Introduction](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/linuxvbox.md#introduction)
- [Installation](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/linuxvbox.md#installation)
- [OS Deployment](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/linuxvbox.md#os-deployment)
	- [Ubuntu-Mate](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/linuxvbox.md#ubuntu-mate)
		- [Prepare VBox](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/linuxvbox.md#prepare-vbox)
		- [Install on VBox](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/linuxvbox.md#install-on-vbox)

## Introduction
VirtualBox is a software package that let you install and run other operating system.
VirtualBox act like virtual computer providing basic requirements for an operating system to run.

The main purpose of this guideline is to help developers who need Linux/Unix programming environment,
but can't install any Linux distros natively at this moment on their Windows laptops.

## Installation

Get Windows Installer on here: https://www.virtualbox.org/wiki/Downloads/

Choose Windows Hosts, let the download finish, and install it as usual.

## OS Deployment

Here an example of installing Ubuntu-Mate or Manjaro-Mate (you choose one) in VirtualBox

### Ubuntu Mate

#### Prepare VBox

First download latest ISO [here](https://ubuntu-mate.org/download/amd64/hirsute/)

Run VirtualBox and click New:

![images](images/vboxnew.png?raw=true)

Give name as you like, but make sure Type is Linux and Version is Ubuntu 64-bit

![images](images/vboxubu0.png?raw=true)

Next give memory size at least 2048 MB

![images](images/vboxubu1.png?raw=true)

Next create virtual hardisk, then choose VDI, then choose Fixed size, give at least 20GB

![images](images/vboxubu2.png?raw=true)

Then, click Create and Main VirtualBox page will shown up.

![images](images/vboxubu3.png?raw=true)

Next, click menu Machine -> Settings -> Storage, choose CD/DVD, then click CD/DVD icon to select ISO file

![images](images/vboxubu4.png?raw=true)

Lastly, click menu Machine -> Start -> Normal Start

![images](images/vboxubu5.png?raw=true)

#### Install on VBox

On Live Session, select Install Ubuntu Mate.

Then leave keyboard layout as is (English-US), click continue

![images](images/vboxubuins0.png?raw=true)

Choose Minimal Installation and uncheck Download Updates for shorter installation time
 
![images](images/vboxubuins1.png?raw=true)
 
Next, for disk installation choose Erase Disk and Install Ubuntu MATE
 
**WARNING:** Make sure you follow this guides as in VirtualBox, **NOT** using USB Disk to boot on actual laptops. Erasing disk on actual laptops will delete all your actual data. You have been warned
 
![images](images/vboxubuins2.png?raw=true)
 
Then click Continue until you see Account dialog like this
 
![images](images/vboxubuins3.png?raw=true)

Enter username and password as you like, but keep it short and simple using only alphanumeric and no space

Then wait installation finish. Click Restart

![images](images/vboxubuins4.png?raw=true)

Ubuntu-Mate ready to use

![images](images/vboxubuins5.png?raw=true)

### Manjaro-Mate

#### Prepare VBox

First download latest Minimal ISO [here](https://download.manjaro.org/mate/21.0.7/manjaro-mate-21.0.7-minimal-210623-linux510.iso)

#### Install on VBox





 
 
 
 
 