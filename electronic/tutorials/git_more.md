# Additional Git Tutorial

## Table Of Contents

## Git Patch

### Definition

A **patch** file is a text file contain difference between two line-oriented text files.
These two files intended as source-code files.
A patch file describe how first file change into second file.
Then a patch file can be used to modify files according to its content

### Creating Patch Example

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
- First line with triple minus sign (**---**), contain information about old filename with its timestamp and timezone
- Second line with triple plus sign (**+++**), contain information about new filename with its timestamp and timezone
- Each lines started and ended with double at (**@@**), contain information about line number that indicate file change section (its called a "hunk")
- Each lines started with minus sign (**-**), meaning this line has been **removed** in new file compared to old file
- Each lines started with minus sign (**+**), meaning this line has been **added** in new file compared to old file
- Other lines with neither plus no minus sign, meaning same line in both old and new files

Lastly, if you want to save the patch content in a file, you can use redirect operator.
For example, to save in a file named *main_patch*:

```sh
diff -Naur main.c main_new.c > main_c.patch
```

### Applying Patch Example

From previous example, we got a patch file named *main_c.patch*.
We will use this patch (its called "applying patch").

Now, use this command to apply patch into *main.c*.

```sh
patch < main_c.patch
```

At this step, the contain between *main.c* and *main_new.c* will be same

**Tips**: You can also revert the changes using command:

```sh
patch -R < main_c.patch
```

### Diff/Patch in Git

After you understand the concept of patch, you dont need worry about using diff and patch command,
because Git program will handle it automatically.

But its recommended to review patches so you know how you programming progress going. 
To see files that changes, use command:

```sh
git status
```

To see patch on entire repository, use command

```sh
git diff
```

To see patch on individual file, use command

```sh
git diff main.c
```

Last, to see patch on each commit, you can use command

```sh
tig
```

Then select a commit entry and type entry to see patch details or use CTRL+C to exit.

## Git GUI

If you start getting tired using Git in command line form, there a bunch GUI client available to help you manage your Git repositories.

Here we will give some brief look on two popular GUI program for Git

### GUI Tk

This program mostly installed by default when you install Git program.
The interface maybe a bit outdated (its Tk interface, what you expect?), but it can do things that you usually do in command line.

To access this program in a Windows computer, you can right-click on empty space at explorer in a Git folder, then click *Git GUI Here*.

![images](images/gitguiwin.PNG?raw=true)

In Linux, you can open terminal in a Git directory path, then if Tk or Tcl library installed, you can use command:

```sh
git gui
```

![images](images/gitguilinux.png?raw=true)

The interface between Windows and Linux are mostly same.

For regular Git workflow (Stage->Commit->Push), you can mostly in these button group:

![images](images/gitguibutton.PNG?raw=true)


### Cola PyQt5

## Collaborative Git and Github

### Permission Method

### Pull-Request Method

## Github Pages

Coming soon

### Carpentries Style

Coming soon

### Ruby Jekyll Preview

Coming soon

