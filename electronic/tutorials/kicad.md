# KiCAD

## Table of Contents
- [Introduction](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/kicad.md#introduction)
- [Installation](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/kicad.md#installation)

## Introduction

KiCad (pronounced "Key-CAD") is a free software suite for electronic design automation (EDA).
It facilitates the design of schematics for electronic circuits and their conversion to PCB designs. 
It features an integrated environment for schematic capture and PCB layout design.
Tools exist within the package to create a bill of materials, artwork, Gerber files,
and 3D views of the PCB and its components.

You can choose EAGLE CAD if you like, but I prefer KiCAD since it open-sources and has amazing 3D preview.
Also it's very popular and additional libraries made by communities are very abundances.

## Installation

### Windows

You can get KiCAD [here](https://kicad-downloads.s3.cern.ch/windows/stable/kicad-5.1.9_1-x86_64.exe)

Note: Download size almost 1.2GB and Installation size almost 6GB.

### Debian/Ubuntu

You can install with command:

```
sudo apt-get install kicad kicad-symbols
sudo apt-get install kicad-footprints kicad-libraries
sudo apt-get install kicad-packages3d kicad-templates
```

### ArchLinux/Manjaro

You can install with command:

```
sudo pacman -S kicad kicad-library kicad-library-3d
```

Here some screenshoots:

![images](images/kicad.png?raw=true)

The circuit 3D viewer is one impressif feature of KiCAD

![images](images/kicad3d.png?raw=true)

## New Project

Open KiCAD from menu, then click _File_ -> _New_ -> Project.
Choose where to put your project, then give a project name, then _Save_.

![images](images/kicad0.png?raw=true)

Here some generated files:
- ***.pro** - Main project file to keep track of the file structure.
- ***.sch** - The schematic.
- ***.kicad_pcb** - The PCB layout.

## Draw a Schematic

Double click ***.sch** file on KiCAD start page.

### Add Components

Click _Place_ -> _Symbol_.
Then click empty space on schematic sheet.

Here you can choose components to add.

![images](images/kicad1.png?raw=true)

### Add Wire

Click _Place_ -> _Wire_.
Then click an unconnected component pin,
then you can start drag wire and connect component.

![images](images/kicad2.png?raw=true)

### Add Power

Click _Place_ -> _Power Port_.
Then click empty space on schematic sheet.

Here you can choose power components to add.

![images](images/kicad3.png?raw=true)

### Compononents Annotation

After some component placed and connected,

![images](images/kicad4.png?raw=true)

Now to give component index as identity, 
click _Tools_ -> _Annotate Schematic_
then click _Annotate_

![images](images/kicad5.png?raw=true)

It will give number index to all components

![images](images/kicad6.png?raw=true)
