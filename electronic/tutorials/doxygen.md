# Doxygen

## Table of Contents
- [Introduction](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/doxygen.md#introduction)
- [Installation](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/doxygen.md#installation)
- [Doxygen Comments](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/doxygen.md#doxygen-comments)
- [Doxyconf](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/doxygen.md#doxyconf)
- [Generate Documentation](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/doxygen.md#generate-documentation)

## Introduction

Doxygen is a documentation generator and static analysis tool for software source trees.
When used as a documentation generator, Doxygen extracts information
from specially-formatted comments within the code.
When used for analysis, Doxygen uses its parse tree to generate
diagrams and charts of the code structure

## Installation

Doxygen document generator need at least two program package, Doxygen itself and Graphviz to generate [callgraph](https://en.wikipedia.org/wiki/Call_graph)

### Debian/Ubuntu

```
sudo apt-get install doxygen graphviz
```

### ArchLinux/Manjaro

```
sudo pacman -S doxygen graphviz
```

### Windows

You can dowload their installer here:
- [Doxygen](https://doxygen.nl/files/doxygen-1.9.1-setup.exe)
- [Graphviz](https://gitlab.com/graphviz/graphviz/-/package_files/6164164/download).

Note: You may need Visual C++ Redistributable 32bit (x86). You can get [here](https://aka.ms/vs/16/release/vc_redist.x86.exe).

After install you may need to add their binary paths
( _C:\Program Files\doxygen\bin\_ and _C:\Program Files\Graphviz\bin\_ )
to Window's system environment variables.

## Doxygen Comments

Doxygen generate centralized documentation by reading and parsing Doxygen formatted comments on every variables, functions, macros, and even files.

Here some examples of Doxygen comments in C sources:

### Files

```c
/**
 * @file    main.c
 * @brief   Main code.
 *
 * @addtogroup Main
 * @{
 */
 
 int main(){
 	return 0
 }
 
 /** @} */
```

### Variables and Macros

```c

/**
 * @brief Off State
 */
#define STT_OFF	0

/**
 * @brief status variables
 * @details Status variable untuk di cek, kemungkinan nilai 0, 1, 2, atau 3	
 */
uint8 status = 0
```

### Functions

```c

/**
 * @brief Fungsi coba pangkat
 * @details Sekedar Fungsi untuk coba-coba bilangan pangkat
 * @param[in] uint8 Angka yg dipangkat
 * @param[in] uint8 Angka pangkat
 * @return uint8 Bilangan hasil pangkat
 */
uint16 coba(uint8 angka, uint8 pangkat){
	return pow(angka, pangkat)
}
```

## Doxyconf

Doxyconf is file that act as a "Makefile" to doxygen generation process.
You can generate it using command:

### Create from templates

To create a doxyconf from template, go to your source-tree folder, open terminal there, and issue:

```
doxygen -s -g coba_doxyconf
```

It will create file coba_doxyconf as the doxyconf

### Edit Doxyconf

First, you need to edit project name and output directory:

```make
PROJECT_NAME		= coba
OUTPUT_DIRECTORY	= coba_doc
GENERATE_HTML	= YES
```

If you use Bash shell, you can use this _sed_ [script](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/doxygen_sed.sh) and issue:

```
chmod a+x ./doxygen_sed.sh
./doxygen_sed.sh coba_doxyconf
```

But if not, then below here some optional settings parameters you can edit manually:

```make
QUIET                  = NO
WARNINGS               = NO
WARN_IF_UNDOCUMENTED   = NO
WARN_IF_DOC_ERROR      = NO
WARN_NO_PARAMDOC       = NO
WARN_AS_ERROR          = NO

ALWAYS_DETAILED_SEC    = YES
VERBATIM_HEADERS       = YES
RECURSIVE              = YES
EXTRACT_ALL            = YES
EXTRACT_STATIC         = YES
EXTRACT_PACKAGE        = YES
EXTRACT_PRIVATE        = YES
EXTRACT_PRIV_VIRTUAL   = YES
EXTRACT_LOCAL_METHODS  = YES
EXTRACT_LOCAL_CLASSES  = YES
SKIP_FUNCTION_MACROS   = NO
HIDE_UNDOC_MEMBERS     = NO
HIDE_UNDOC_CLASSES     = NO
FULL_PATH_NAMES        = NO

HAVE_DOT               = YES
UML_LOOK               = YES
CALL_GRAPH             = YES
CALLER_GRAPH           = YES
CLASS_DIAGRAMS         = YES
DOT_MULTI_TARGETS      = YES
INCLUDE_GRAPH          = YES
INCLUDED_BY_GRAPH      = YES
DIRECTORY_GRAPH        = YES
DOT_TRANSPARENT        = YES
GRAPHICAL_HIERARCHY    = YES
HIDE_UNDOC_RELATIONS   = NO

SOURCE_BROWSER         = YES
MARKDOWN_SUPPORT       = YES
STRIP_CODE_COMMENTS    = YES
CASE_SENSE_NAMES       = YES
WARN_NO_PARAMDOC       = YES
REFERENCED_BY_RELATION = YES
REFERENCES_RELATION    = YES
ENABLE_PREPROCESSING   = YES
MACRO_EXPANSION        = YES
EXPAND_ONLY_PREDEF     = YES
SEARCHENGINE           = YES
DOCBOOK_PROGRAMLISTING = YES
ALPHABETICAL_INDEX     = NO
INHERIT_DOCS           = NO
SORT_MEMBER_DOCS       = NO
REFERENCES_LINK_SOURCE = NO
USE_MATHJAX            = NO
DISABLE_INDEX          = NO
GENERATE_TREEVIEW      = NO

GENERATE_DOCBOOK       = NO
GENERATE_LATEX         = NO
GENERATE_HTMLHELP      = NO
GENERATE_RTF           = NO
GENERATE_MAN           = NO
GENERATE_XML           = NO
GENERATE_AUTOGEN_DEF   = NO
GENERATE_PERLMOD       = NO
```

## Generate Documentation

Next, open terminal/CMD in source-tree path where doxyconf file reside.
Then you can issue command like this:

```
doxygen coba_doxyconf
```

Then you can open html documentation in output directory.
For example, you can open documentation using command:

```
firefox coba_doc/html/index.html
```

**Note**: Some old or bad browser like IE can't render Doxygen HTML properly.

Here some preview of result:
- on a file
![images](images/doxy0.JPG?raw=true)
- on function
![images](images/doxy1.JPG?raw=true)
- on variable
![images](images/doxy2.JPG?raw=true)