# Arch Linux Package Managing (by Achmadi)

This is some cheat-sheet to help new comer on Arch Linux distribution family.

## Requirement

Basic requirement are:

### 1. Arch Linux distro family running setup
Arch Linux and derivaties distro including:
- Manjaro
- Chakra Linux
- Velt OS
- ArchBang
- Anarchy 

### 2. Bash or Zsh familiarity
Should familiar with Bash or Zsh terminal or terminal emulator.
At least not terrified with terminal interface.
Recommended to know how to change active directory and rise privilage to admin/root.


## Preparation

Simple preparation need to check:

### 1. Active Internet

Connect Internet on Ethernet or WiFi.
Good internet need to download binary/source packages. 

### 2. Check binary repository server
Open file **/etc/pacman.d/mirrorlist** in root privilage.
This is list of latest usable Arch binary repo server.
If this leave unmodified, Arch would use nearest server.
If want to use one preferred server, uncomment it.

For Indonesia, prefreably use one Australian server on internode.
Just find and uncomment (remove #) on:
```
Server = http://mirror.internode.on.net/pub/archlinux/$repo/os/$arch
```

Using Indonesia local server are not recommended since they are not maintained well.

### 3. Check package installation configuration

Open file **/etc/pacman.conf** in root privilage.
This is configuration for package manager.
Some optional but useful config:

#### Disable all package signature checking.
If want to speed up installation and 
you are not having trust issues, this is for you.
Edit this:
```
SigLevel    = Required DatabaseOptional
LocalFileSigLevel = Optional
```
to this:
```
SigLevel = Never
LocalFileSigLevel = Never
``` 

#### enable 32-bit

If you are a developer or hobbist who may need 32-bit (x86 or i686) architecture packages,
you need enabled it.
Find and uncomment (remove #) on this line:
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
 
#### initialize pacman keyring (optional and often unnecessary)
This command might solve occasionally package keyring problem
```
pacman-key --init
pacman-key --populate archlinux manjaro
pacman-key --refresh-keys
```
 
 
## Package(s) Installation

For binary installation, the main command is:
```
pacman -S
```

Letter 'S' standfor 'sync' 

### Get Help

```
pacman -Sh
```

### Update package list from server (root)

```
pacman -Sy
``` 

This will update list for packages available on preferred server.
As *rolling-release* distribution, official binary updated every weeks,
but user can choose anytime to update.
No need update in every week except you have infinite internet.

notes:
- List package located at: **/var/lib/pacman/sync/**.
- List package files are ***.db** with name using subcategories of binary repo. 
- File-list package files are ***.files** with name using subcategories of binary repo. 

### Search availabe a package

```
pacman -Ss
```
 
Little 's' stand for 'search'.

example:
```
pacman -Ss nodejs
```  

To simplify search, details can be ommited by add 'q' (quiet).

example:
```
pacman -Ssq nodejs
```

### View package information

```
pacman -Si 
```

Little 'i' standfor information

example:
```
pacman -Si nodejs 
``` 

To get more detailed, use double i ('ii')
```
pacman -Sii nodejs
```

### Install package(s) (root)

```
pacman -S
```

example
```
pacman -S nodejs
```

example for multiple packages:
```
pacman -S nodejs npm
```

It will ask confirmation, press 'y' or just Enter.
This will download and install packages and all it's dependencies.

notes:
- Package cache located at: **/var/cache/pacman/pkg/**.
- Packages file using format ***.pkg.tar.xz** with name pattern **name-version-release-architecture**

### Upgrade the whole installation (root).

first update package list:
```
pacman -Sy
```

then upgrade:
```
pacman -Su
```

Little 'u' standfor 'upgrade'
On less frequent update system, sometimes there's need remove confirmation for conflicted and deprecated packages.

Or if pretty sure to just say 'yes' on all comfirmation:
```
yes | pacman -Su
```

### Clean-up cache (root)

```
pacman -Sc
```

Little 'c' standfor 'clean'
This will clean-up unnecessary package cache file and list to save storage

To clean-all (including installed packages) use double 'c':
```
pacman -Scc
```

## Query Packages

For query (checking) installed packages, main command:
```
pacman -Q
```

### Get help

```
pacman -Qh
```

### List package installed

```
pacman -Q
```

To list only name without version number, add 'q' (quiet):
```
pacman -Qq
``` 

To get specific package name, use piping to 'grep'.

example:
```
pacman -Q | grep nodejs
pacman -Qq | grep nodejs
```

### List file installed by a package

```
pacman -Ql
```

example:
```
pacman -Ql nodejs
```

Little 'l' standfor list

To ommit package name (so get file list only), add 'q':

example:
```
pacman -Qlq nodejs
```

### Check a file belongs to which package

```
pacman -Qo
``` 

Litte 'o' standfor 'owned' by a package.

example:
```
pacman -Qo /usr/include/node/v8.h
```

or if want simpler output (package name only):
```
pacman -Qoq /usr/include/node/v8.h
```

### Check orphaned package

~~~
pacman -Qdttq
~~~

This will list package that:
- installed as dependencies for other packages ('d')
- no longer required as dependencies but not optional ('tt') 

Option 'q' just for ommit version.

This command useful for cleaning-up packages that no longer required
by any explicitly installed packages.

## Package(s) Removal

### Get help

```
pacman -Rh
```

### Remove package (root)

```
pacman -Rns
```

Options details:
- 'R' for 'remove'
- 'n' for 'nosave' so all config files also be removed 
- 's' for remove recursively including all it's dependencies (it not required by othe packages)

example:
```
pacman -Rns nodejs
```

### Remove orphaned packages (root)

```
pacman -Rns $(pacman -Qdttq)
```

Use in combination of list orphaned and remove command.

## Query Packages without install

This for checking if file available on a packages without installing it first:
Main command:
```
pacman -F
```

Letter 'F' standfor 'file'.
This command more-less are same with 'pacman -Q',
but without installing it first.

### Get Help

```
pacman -Fh
```

### List file available on a package

```
pacman -Fl 
```
Litte 'l' standfor 'list' by a package.

example:
```
pacman -Fl nodejs
```

or ommit packages name (file list only), use 'q' (quite):
```
pacman -Flq nodejs
```

### Search a file and check on which package available

```
pacman -Fs
```
Litte 's' standfor 'search' file.

example
```
pacman -Fs v8.h
```

Or if want to ommit version (repo category and package name only), add 'q' (quiet)
```
pacman -Fsq v8.h
```

### Check a file belongs to a package

if you know the absolute file name before installing, you can check which package own it by:
```
pacman -Fo
``` 

Litte 'o' standfor 'owned' by a package.

example
```
pacman -Fo /usr/include/node/v8.h
``` 

Or if want repo category and package name only, add 'q' (quiet)
```
pacman -Foq /usr/include/node/v8.h
```

## Install package not from repo

If want to install an Arch package (*.pkg.tar.xz) that not from binary repo
and without checking on list available, use:
```
pacman -U
```

Letter 'U' means 'upgrade' a package.
This command always need to run as root.

example, you build a package by yourself with name 'led-1.2-4.pkg.tar.xz':
```
pacman -U led-1.2-4.pkg.tar.xz
``` 

## Install package form AUR

This is step to build and install package form AUR
- Open https://aur.archlinux.org/
- Search your package on **Package Search** tab
- It will list all related package, choose what you need
- Click that package to open package page
- Download recipe by clicking **Download snapshot**
- After a ***.tar.gz** download, extract it
- Go to extracted directory, make sure a recipe file named **PKGBUILD** exist.
- Open terminal on that directory path, run **without root**:
```
makepkg -sir
```  

Detailed command:
- 's' means install both make dependencies and run dependencies
- 'i' install after build complete. It will ask root/sudo password
- 'r' remove make dependencies after installation complete
 
Some pakcage may has signature problem, the solution is skip pgp signature check
```
makepkg -sir --skippgpcheck
``` 

## Summary (in Bash shell commands)

### Important file and path

```
# Mirror server list
less /etc/pacman.d/mirrorlist

# Package Manager configuration
less /etc/pacman.conf

# Package list
ls -1 /var/lib/pacman/sync/

# Package download cache
ls -1 /var/cache/pacman/pkg/
```

### Install binary

```
# update package list (root)
pacman -Sy

# search a package
pacman -Ss <match_package_name> 
pacman -Ssq <match_package_name> 

# get information a package
pacman -Si <exact_package_name>
pacman -Sii <exact_package_name>

# install package(s) (root)
pacman -S <exact_package_name>
pacman -Si <exact_package_name> <exact_package_name> 

# upgrade whole installation
pacman -Sy
pacman -Su
yes | pacman -Su

# clean-up package and list cache (root)
pacman -Sc
pacman -Scc
```

### Query installed

```
# list installed
pacman -Q
pacman -Qq
pacman -Qq | grep <match_package_name> 

# list file installed by a package
pacman -Ql <exact_package_name> 
pacman -Qlq <exact_package_name> 

# search package owned a file
pacman -Qo <absolute_file_name>
pacman -Qoq <absolute_file_name>

# list orphaned and not optional packages
pacman -Qdttq
```

### Remove packages

```
# remove package and it's all no-longer required dependencies (root)
pacman -Rns <exact_package_name> 

# remove orphaned and not optional packages (root)
pacman -Rns $(pacman -Qdttq)
```

### Query packages not installed yet

```
# list file available on a package
pacman -Fl <exact_package_name> 
pacman -Flq <exact_package_name> 

# search a file available on which package
pacman -Fs <match_file_name>
pacman -Fsq <match_file_name>

# check a file available on which package
pacman -Fo <absolute_file_name>
pacman -Foq <absolute_file_name>
```

### Install a package outside from repo

```
# install package file directly (root)
pacman -U name-version-release-architecture.pkg.tar.xz
```

### install from AUR

```
# download recipe from AUR
# extract package.tar.gz
# open extracted directory in terminal
ls PKGBUILD

# build and install (non-root)
makepkg -sir

# skip signature check, hbuild and install (non-root)
makepkg -sir --skippgpcheck
```