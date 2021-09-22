## ESP32 Example

![images](../../images/esp-nodemcu-32.jpg?raw=true)

An example ESP32 programming using ESP-IDF for LED Blink and UART Shell

## Structures

File Structures:

```
esp32
+-- README.md             # This file
+-- Makefile              # Make build file
+-- ESP32example_doxyconf # For build Doxygen
+-- main                  # Main source folder
|   +-- example.c         # Main source code
|   +-- command.c         # Command callback code
|   +-- command.h         # Command callback header
|   +-- shell.c           # UART Shell code
|   +-- shell.h           # UART Shell header
|   +-- component.mk
```

## How To Test

Read instructions [here](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/internship/tutorials/esp32.md)

After flashing program, run your favorite serial terminal (115200,8N1) and type:

```sh
help
```

It will registered command.

or try:

```sh
version
```

It will shows version information.
