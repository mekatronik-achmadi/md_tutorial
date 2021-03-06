# Git

## Table Of Content
- [Introduction](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#introduction)
- [Installation](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#installation)

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
sudo apt-get install git
```

For ArchLinux/Manjaro:

```
sudo pacman -S git
```

To test installation, type command:

```
git --version
```

![images](images/gitbash.JPG?raw=true)

## Create your ID

Before to proceed any work using git, you have input your name and email as identity.
Issue command like this:

```
git config --global user.name "Achmadi"
git config --global user.email "mekatronik.achmadi@gmail.com"
```

## Create Git Directory

To create a new Git directory, create a new folder where all your project files reside.
Then open Git Bash there and type command:

```
git init
``` 

It will create a hidden _.git_ folder and initialize a new empty git repository in that folder.
For whatever reason, dont touch the hidden _.git_ folder.

## Add Untracked Files

By default, when you create a new files, it is not automatically add to tracked files.
Git will not track any changes or modification on untracked files.

For example, you create a new file named _main.c_ with this content:

```c
#include <stdio.c>

int main(void){
	return 0;
}
```

Now, when you issus this command:

```
git status
``` 

![images](images/gitsttuntracked.JPG?raw=true)

You will see information that there some untracked file (red colored).

Now, to add that new file into _staged_ (chosen to commit), use command:

```
git add main.c
```

or if you has many file and one to stage them as one, use command:

```
git add *
```

then you can check using status command.


![images](images/gitadduntracked.JPG?raw=true)

As you can see, the main.c become green-colored as a new file.

Next, you can _commit_ (freeze the new/changes) using command:

```
git commit -m "add main.c"
```

The word after -m is known as commit-message, work as a short description of commit.
You free to choose any commit-message, but please keep short and clear.

![images](images/gitcommitnew.JPG?raw=true)

