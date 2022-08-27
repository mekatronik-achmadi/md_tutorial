# Git

## Table Of Content
- [Introduction](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#introduction)
- [Installation](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#installation)
- [Create ID](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#create-your-id)
- [Create Git Repository](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#create-git-directory)
- [General Workflow](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#general-workflow)
- [Add Untracked Files](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#add-untracked-files)
- [Add Modified Files](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#add-modified-files)
- [Git History](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git.md#commit-history)

## Introduction

Git is software for tracking changes in any set of files,
usually used for coordinating work among programmers collaboratively developing source code during software development.
Its goals include speed, data integrity, and support for distributed,
non-linear workflows (thousands of parallel branches running on different systems).

## Installation

For Windows, you can download [here](https://git-scm.com/download/win).
Download the **Windows setup** (not the portable package).

Run the installer program

![images](images/gitwin0.PNG?raw=true)

Make sure you check both **Git Bash** and **Git GUI**.

![images](images/gitwin1.PNG?raw=true)

For default text editor, you can choose **Notepad++**.

![images](images/gitwin2.PNG?raw=true)

For Bash to used even in Windows PowerShell, choose to write complete PATH.

![images](images/gitwin3.PNG?raw=true)

The rest option you can just leave it default

![images](images/gitwin4.PNG?raw=true)

After installation, you can right-click on empty space at explorer, then click _Git Bash Here_.

![images](images/gitwin5.PNG?raw=true)

To test installation, type command:

```
git --version
```

![images](images/gitbash.JPG?raw=true)

For Debian/Ubuntu installation:

```
sudo apt-get install git tig
```

For ArchLinux/Manjaro installation:

```
sudo pacman -S git tig
```

## Create your ID

Before you proceed any work using git, you have input your name and email as identity.
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

![images](images/gitinit.png?raw=true)

For whatever reason, dont touch the hidden _.git_ folder.

## General Workflow

After initiating a Git directory, general your Git workflow will be look like this

![images](images/githubworkflow.jpg?raw=true)

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

As you can see, the main.c become staged (green-colored) as a new file.

Next, you can _commit_ (freeze the new/changes) using command:

```
git commit -m "add main.c"
```

The word after -m is known as commit-message, work as a short description of commit.
You free to choose any commit-message, but please keep short and clear.

![images](images/gitcommitnew.JPG?raw=true)

## Add Modified Files

Next topic is how to add (commit) modification of tracked files.

For example, now add some modification to previous main.c.

```c
#include <stdio.c>

int main(void){
	uint8 result;
	
	result = 10 + 20; 
	
	return result;
}
```

Now, issue status command:

```
git status
```

![images](images/gitmod.JPG?raw=true)

As you can see, main.c now become red colored as a modified file.

To see modification or what changes on that file, type command:

```
git diff main.c
```

![images](images/gitmoddiff.JPG?raw=true)

What you see is an example of code _patch_.
Most important of a patch are:
- the red and started by (-) are removed line
- the green and started by (+) are added line
- the others are unchanged line

Now, to add stage the modified file, is same as before:

```
git add main.c
```

or if many files at once:

```
git add *
```

then you can check using status command.

![images](images/gitaddmod.JPG?raw=true)

As you can see, the main.c become staged (green-colored) as a modified file.

Next, to commit the modification/changes, using command as before:

```
git commit -m "modify main.c"
```

![images](images/gitmodcommit.JPG?raw=true)

## Commit History

Checking and reviewing commit history is the only effective way to see how your code development progessing.

Now to see commit history, use command:

```
tig
```

![images](images/tig.JPG?raw=true)

To see code patch in a commit, select a commit entry and press enter:

![images](images/tigpatch.JPG?raw=true)

To exit from tig page, press **q** or **CTRL+c**.