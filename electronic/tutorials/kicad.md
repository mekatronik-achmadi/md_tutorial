# KiCAD

## Table of Contents
- [Introduction]()
- [Installation]()

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
sudo apt-get install kicad kicad-symbols kicad-footprints kicad-libraries kicad-packages3d
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