# Doxygen

## Table of Contents
-

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

After install you may need to add their binary paths
(C:\Program Files\doxygen\bin\ and C:\Program Files\Graphviz\bin\)
to Window's system environment variables.

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

then here some other settings parameters you can edit:

```make
ALWAYS_DETAILED_SEC    = YES
EXTRACT_STATIC         = YES
EXTRACT_LOCAL_CLASSES  = YES
HIDE_UNDOC_MEMBERS     = YES
HIDE_UNDOC_CLASSES     = YES
VERBATIM_HEADERS       = YES
RECURSIVE              = YES
EXTRACT_ALL            = NO
EXTRACT_PRIVATE        = NO
FULL_PATH_NAMES        = NO
SKIP_FUNCTION_MACROS   = NO

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

SOURCE_BROWSER         = YES
GENERATE_TREEVIEW      = YES
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
GENERATE_TREEVIEW      = YES
DISABLE_INDEX          = YES
DOCBOOK_PROGRAMLISTING = YES
ALPHABETICAL_INDEX     = NO
INHERIT_DOCS           = NO
SORT_MEMBER_DOCS       = NO
REFERENCES_LINK_SOURCE = NO
USE_MATHJAX            = NO

#CLANG_DISABLED_AT_COMPILE=
#CLANG_DISABLED_AT_COMPILE=
```

alternatively, if you use Bash shell, you can use the sed script [here]() and issue:

```
./doxygen_sed.sh coba_doxyconf
```