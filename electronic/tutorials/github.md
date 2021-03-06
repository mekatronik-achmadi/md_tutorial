# Github

## Table of Contents
- [Introduction](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/github.md#introduction)
- [New Account](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/github.md#open-new-account)
- [New Repository](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/github.md#create-new-repository)
- [Add Git Local](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/github.md#add-github-repository-to-local-git)
- [Push Commit](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/github.md#push-commit)
- [Git Clone](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/github.md#git-clone)
- [Git Pull](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/github.md#git-pull		)

## Introduction

Github is an internet service that host Git repository.
It's like Instagram, but instead stores stupid photos/videos,
Github stores Git repositories and connect programmer/developers around the world.

## Open New Account

If you can Sign-Up on Facebook/Instagram, then you should able to signing up on Github.
Just choose free personal account and you can skip advance feature setup like Two-Ways Authentication or SSH Public Key.

But if you still need some guides, you can look [here](https://git-scm.com/book/en/v2/GitHub-Account-Setup-and-Configuration) and [here](https://www.wikihow.com/Create-an-Account-on-GitHub)

## Create New Repository

Now assume you already sign-up you new Github account, next topic is create new Github repository.
This tutorial taken from this Github official [page](https://docs.github.com/en/github/getting-started-with-github/create-a-repo).

First, in the upper-right corner of any page, use the drop-down menu, and select New repository.

![images](images/githubreponew0.png?raw=true)

Type a short, memorable name for your repository.

![images](images/githubreponew1.png?raw=true)

Add a description of your repository

![images](images/githubreponew2.png?raw=true)

Choose a repository visibility. Public Repository is most preferable

![images](images/githubreponew3.png?raw=true)

Last, click Create repository.

![images](images/githubreponew4.png?raw=true)

## Add Github Repository to Local Git

Now, add previously created Github repository to previously Git local.

First, open Git Bash on previously Git folder and issue command like this:

```
git remote add origin https://github.com/mekatronik-achmadi/RepoTest.git
```

then push it to Github using command:

```
git push -u origin master
```

You will need to input your Github username (not email) and password into a pop-up dialog box.

![images](images/gitpush.JPG?raw=true)

## Push Commit

Next working cycle on Git and Github next will essentially like this:
- Make modification or add new untracked files
- Check modified or new file:

```
git status
```

If necessary, review code patch:

```
git diff file
```

- Stage modified or new file:

```
git add file1 file2 file3
```

or

```
git add *
```

- Commit staged files:

```
git commit -m "a descriptive message"
```

- Push it to Github

```
git push -o origin master
```

## Git Clone

This part tutorial is reversed than previosly tutorials.
We started with an existed Github repository, but no local Git resository.

First, clone the existed Github repository.
Make sure there is no folder with same name with repository name that about to clone.
Then type command like this:

```
git clone https://github.com/mekatronik-achmadi/RepoTest.git
```

![images](images/gitclone.JPG?raw=true)

Then you can change directory into cloned repository and work cycle stage-commit-push as previosly.

## Git Pull

After you clone a Github repository then that repository getting update, 
you don't have to delete cloned directory and re-cloned.

All you have to do is doing pull to get update patch from Github
and merge it with existing local cloned repository.

This also work if you working collaboratively when the Github repository updated by other contributor
and you want to get their update.

To pull from github, use command like this:

```
git pull origin master
```

![images](images/gitpull.JPG?raw=true)