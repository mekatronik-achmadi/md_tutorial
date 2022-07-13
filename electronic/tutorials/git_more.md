# Additional Git Tutorial

## Table Of Contents

## Git Patch

### Definition

A **patch** file is a text file contain difference between two line-oriented text files.
These two files intended as source-code files.
A patch file describe how first file change into second file.

The term **patch** and **diff** are often interchangeable, altough there some slight differences.
A diff only contain the differences content between two files, 
while a patch is a diff file with additional content like filenames and line position numbers.
For the sake of this tutorial, we treat patch and diff as same thing.

### Example Creating Patch

Lets learn patch file using example.
First create a file named *main.c* with contents like this:

```c
#include <stdio.h>
#include <stdarg.h>

int main(void){
    return 0;
}
```

Next, copy and paste this file, the renamed it to *main_new.c*.
Edit the file to look like this:

```c
#include <stdio.h>
#include <stdlib.h>

int main(void){
    printf("hello\r\n");
    return 0;
}
```

Now, open a terminal in directory where these two files reside, then type this command:

```sh
diff -Naur main.c main_new.c
```

it will produce output like this:

```patch
--- main.c	2022-07-13 21:08:58.472365285 +0700
+++ main_new.c	2022-07-13 21:04:03.335125912 +0700
@@ -1,6 +1,7 @@
 #include <stdio.h>
-#include <stdarg.h>
+#include <stdlib.h>
 
 int main(void){
+    printf("hello\r\n");
     return 0;
 }
```

Here the general explanations:
- First line with triple minus sign (---), contain information about old filename with its timestamp and timezone
- Second line with triple plus sign (+++), contain information about new filename with its timestamp and timezone
- Each lines started with minus sign (-), meaning this line has been **removed** in new file compared to old file
- Each lines started with minus sign (+), meaning this line has been **added** in new file compared to old file
- Other lines with neither plus no minus sign, meaning same line in both old and new files

## Git GUI

### GUI Tk

### Cola PyQt5

## Collaborative Git and Github

### Permission Method

### Pull-Request Method

## Github Pages

### Github Jekyll

### Carpentries Style

