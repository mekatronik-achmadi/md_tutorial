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

### Assign Footprint

After schematic drawing is done,

![images](images/kicad7.png?raw=true)

Next is assign schematic symbol to actual components footprints.
Click _Tools_ -> _Assign Footprints_

![images](images/kicad8.png?raw=true)

When finished, click _Apply_ then _OK_

### Generate Netlist

Last thing to do in schematic is generate **Netlist**.

Netlist (.net) file is the "bridge" between schematic and pcb files.

Click _Tools_ -> _Generate Netlist File_.
Check _Default Format_, then click _Generate Netlist_.

![images](images/kicad9.png?raw=true)

It will open save dialog, leave path and name as is, then click _Save_.

## Draw a PCB

Double click ***.kicad_pcb** file on KiCAD start page.

### Load Netlist

First, load the Netlist.
Click _Tools_ -> _Load Netlist_

Click browse icon to open .net file.
Then click _Update PCB_
	
![images](images/kicad10.png?raw=true)

After you click _Close_, you will get all components footprints and it's connections.

![images](images/kicad11.png?raw=true)

### Arrange Components

Next, arrange each component as you like.

Some shortcut often use:
- **m** to move components
- **f** to flip components bottom-top
- **r** to rotate

![images](images/kicad12.png?raw=true)

### Board Setup

To setup some board drawing property, click _File_ -> _Board Setup_

Here on _Tracks and Vias_, you can set some wire and vias size.

![images](images/kicad13.png?raw=true)

### Wire Route

To convert virtual wire to actual wire, first choose a suitable wire and vias size.
Then click _Route_ -> _Single Track_.

Here you can drag and draw actual wire.

![images](images/kicad14.png?raw=true)

Then you can draw your PCB wire as good as possible

![images](images/kicad15.png?raw=true)

### Add Board Edge

First, click _Place_ -> _Line_, then for layer choose _Edge Cuts_.

![images](images/kicad16.png?raw=true)

Then draw good connected line.

![images](images/kicad17.png?raw=true)

### Add Zones

First, click _Place_ -> _Zone_, then for layer choose _F.Cu_ or _B.Cu_.

![images](images/kicad18.png?raw=true)

Then click previously edge, zone setting dialog will pop-up.

![images](images/kicad19.png?raw=true)

For now, leave all as is and just click _OK_.
Then you can draw zone area (click to switch from line to area).

![images](images/kicad20.png?raw=true)

After all area covered, double click to finish

![images](images/kicad21.png?raw=true)

### View 3D

At this point, the PCB design already usable.

To check 3D preview, click _View_ -> _3D Viewer_.

![images](images/kicad22.png?raw=true)