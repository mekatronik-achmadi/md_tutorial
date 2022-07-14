# Additional Git Tutorial

## Table Of Contents
- [Git Patch](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#git-patch)
    + [Creating Patch](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#creating-patch-example)
    + [Applying Patch](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#applying-patch-example)
    + [Git Implementation](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#diffpatch-in-git)
- [Git GUI](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#git-gui)
    + [GUI Tk](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#gui-tk)
    + [Cola PyQt5](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#cola-pyqt5)
- [Collaborative Programming](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#collaborative-git-and-github)
    + [Permission Method](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#permission-method)
    + [Pull-Request Method](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#pull-request-method)
    + [Other Contribution Method](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#other-contribution-method)
- [Github Pages](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#github-pages)
    + [Minimal Example](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#minimal-example)
    + [Carpentry Style](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#carpentry-style)
    + [Jekyll Preview](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/git_more.md#ruby-jekyll-preview)

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

In Linux, you may install Tk library first.
For Debian/Ubuntu:

```sh
sudo apt-get install tk
```

For ArchLinux/Manjaro:

```sh
sudo pacman -S tk
```

Then, you can use same command:

```sh
git gui
```

![images](images/gitguilinux.png?raw=true)

The interface between Windows and Linux are mostly same.

For regular Git workflow (Stage->Commit->Push), its done mostly in these button group:

![images](images/gitguibutton.PNG?raw=true)

### Cola PyQt5

Cola is an alternative to Git GUI.
Unlike previous interface that written in Tk, Cola written in PyQt5 toolkit.

For Windows, you can download [here](https://git-cola.github.io/downloads.html).
Download the installer Windows section, then install it (use default setting).
You can skip the installation notes advice.

After installation, you can right-click on empty space at explorer in a Git folder, then click *Git Bash Here*.

Then use command:

```sh
git cola
```

It will open Cola interface like this

![images](images/gitcolawin.PNG?raw=true)

For Debian/Ubuntu:

```sh
sudo apt-get install git-cola
```

For ArchLinux/Manjaro, its available at [AUR](https://aur.archlinux.org/packages/git-cola)

Then you can open terminal in a Git directory path and use same command:

```sh
git cola
```

![images](images/gitcolalinux.png?raw=true)

For regular Git workflow (Stage->Commit->Push), its done mostly in these menu:

![images](images/gitcolacommit.png?raw=true)

![images](images/gitcolapush.png?raw=true)

## Collaborative Git and Github

Most Source-Code Manager (SCM) are created to be content tracker program that record changes in files and folders.
Git is no exception.

Now by sharing and contributing patch each other between programmers, Git help a team programmer to do programming collaboratively.
Today Github extent that Git capability futher using the technology we called internet.

In this section we will give a brief explanation how do programming collaboratively using Git and Github.

### Permission Method

This first method is rather easier.
You give permission to other Github Account to push into your repository.

**WARNING:** Choose this method only if you really trust the person you give access both on technicality and attitude aspect.

To invite some as contributor in one of your repository, go to **Settings** in a repository

![images](images/githubcollab_0.png?raw=true)

Then go to tab **Collaborators and Teams**

![images](images/githubcollab_1.png?raw=true)

Here you can see a manager page to help you manage collaborators.
You can invite people using button **Add People** and give them **Role** at least **Write**.

![images](images/githubcollab_2.png?raw=true)

If they accept your invitation, they will able to push directly into your repository.

**CAUTION:** If you are invited and has access to someone else repository, make sure you doing **git pull** 
before doing modification to avoid conflicts with other people changes.

### Pull-Request Method

This method is a bit more complex, but it much more flexible and secure.
This method is more recommended, especially if you have trust issue or taking precaution (or both).

The difference between previous method, is you dont give push access to anyone.
Instead, other people offer you a patch (we call it **pull-request**),
then you decide whether you approve and merge their patch,
or reject it all together.

To simplify explanation, we will use term **contributor** as other people who contribute and doing pull-request.
While **maintainer** as repository owner who decide to accept the patch or not.

In a nutshell, the workflow will look like this

![images](images/github-workflow.avif?raw=true)

#### Contributor Forking

First, to contribute, do **fork** the repository you want to contribute.
A Fork basically a copy of a repository in your own Github account.

To fork a repository, click the Fork button

![images](images/githubpr_0.png?raw=true)

After forking done, you will have your own copy of that repository in your own Github account,
with the repository's name indicate its a forked repository from someone else

![images](images/githubpr_1.png?raw=true)

#### Contributor Working

After forking, you can modify your own fork repository like your own.
Do stuff like:
- Do **git clone** the repository to your local computer.
Remember to clone your own fork instead the original repository
- Do your modifications.
- Do regular **Stage** and **Commit** on your local
- Do **git push** from your local to your own fork.
Remember to not push into original repository (you wont able anyway)

#### Contributor Pull-Request

After push to your fork done, you can ask the maintainer to merge your modification into original repository.

Click **Contibute** menu and click **Open Pull Request**

![images](images/githubpr_2.png?raw=true)

#### Maintainer Review and Merge Pull-Request

If you happen the maintainer, you can see pull requests in the tab **Pull requests**

![images](images/githubpr_3.png?raw=true)

Here you can review and merge patch from contrbutors.
Merged pull request will recorded as new commit into repository.

### Other Contribution Method

If you dont really fancy do programming, you still can contribute by reporting problems and bugs.

Use **Issues** tab to open new thread and report your found problems and bugs

![images](images/githubpr_4.png?raw=true)

Also you can suggest or ask new features or improvements using **Discussions** tab

![images](images/githubpr_5.png?raw=true)

At this point, you use Github just like other social media platform to improves a project repository.
This absolutely still counted as contribution.

## Github Pages

Coming soon

### Minimal Example

Coming soon

### Carpentry Style

Coming soon

### Ruby Jekyll Preview

Coming soon

