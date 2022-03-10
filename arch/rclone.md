# RClone Tutorial

## Contents
- [Requirements](#requirement)
- [Install](#install)
    + [ArchLinux](#archlinux)
    + [Debian/Ubuntu](#debianubuntu)
    + [Non GNU/Linux OS](#non-gnulinux-os)
- [Usage](#usage)
    + [Authenication](#authentication)
    + [Mounting](#mount)
    + [Unmounting](#unmount)
- [Startup Service](#startup-services)
    + [Systemd Unit](#systemd-unit)
    + [Service Control](#service-control)
    + [Service Autostart](#service-control)

## Requirements

Some requirement to follow this tutorial:
- Decent GNU/Linux operating system
- Good internet connection
- Can lift user privillage using sudo command
- Familiar with Bash/Zsh as CLI interface
- Please dont be too lazy

## Install

Here how installation process on major OS

### ArchLinux

For Arch Linux user and its derivative (Manjaro/EndeavorOS), use this command to download and install

```sh
$ sudo pacman -S rclone fuse2
```

If you version already outdate but you too lazy to upgrade, install [downgrade](https://github.com/pbrisbin/downgrade) from this [AUR](https://aur.archlinux.org/packages/downgrade), then issue command

```sh
$ sudo downgrade rclone fuse2
```

Choose your required version to install.

**Tips**: If you need some GUI manager, consider to install [RClone Browser](https://github.com/kapitainsky/RcloneBrowser) from this [AUR](https://aur.archlinux.org/packages/rclone-browser)

### Debian/Ubuntu

For Debian, Ubuntu and their derivatives user, you can drown yourself in mud.

### Non GNU/Linux OS

Ask yourself, why do you even exist in this world?

## Usage

**NOTES**: From here and on, all works done in Bash/Zsh CLI without touching any GUI program.
We walk talk it later time.

### Authentication

First you need authentication access so Google Drive will allow RClone to do read/write.

Issue this command:

```sh
$ rclone config
```

Resulting:

```sh
2022/03/10 22:06:49 NOTICE: Config file "/home/achmaday/.config/rclone/rclone.conf" not found - using defaults
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q>
```

input **n** and then **google-drive**

```sh
2022/03/10 22:06:49 NOTICE: Config file "/home/achmaday/.config/rclone/rclone.conf" not found - using defaults
No remotes found - make a new one
n) New remote
s) Set configuration password
q) Quit config
n/s/q> n
name> google-drive
```

It will all supported services.
Scroll down and find the Google Drive service.
In my case it will look like this

```sh
16 / Google Drive
   \ "drive"
```

Then input the number at **Storage**

```sh
43 / http Connection
   \ "http"
44 / premiumize.me
   \ "premiumizeme"
45 / seafile
   \ "seafile"
Storage> 16
```

Next, just press Enter to use default **client_id** and **client_secret**

```sh
Option client_id.
Google Application Client Id
Setting your own is recommended.
See https://rclone.org/drive/#making-your-own-client-id for how to create your own.
If you leave this blank, it will use an internal key which is low performance.
Enter a string value. Press Enter for the default ("").
client_id>
Option client_secret.
OAuth Client Secret.
Leave blank normally.
Enter a string value. Press Enter for the default ("").
client_secret>
```

Next is scope option, choose Full access without Application Data folder (number **1**).

```sh
 1 / Full access all files, excluding Application Data Folder.
   \ "drive"
 2 / Read-only access to file metadata and file contents.
   \ "drive.readonly"
   / Access to files created by rclone only.
 3 | These are visible in the drive website.
   | File authorization is revoked when the user deauthorizes the app.
   \ "drive.file"
   / Allows read and write access to the Application Data folder.
 4 | This is not visible in the drive website.
   \ "drive.appfolder"
   / Allows read-only access to file metadata but
 5 | does not allow any access to read or download file content.
   \ "drive.metadata.readonly"
scope> 1
```

Just press Enter for **root_folder_id**, **service_account_file**, **Edit advanced config?**.
Then press **y** for **Use auto config?**.

After pressing Enter, it will open Google Drive Permission on your default webrowser.
Allow it and will give **Success** response on webrowser.

![images](rclone.png?raw=true)

Next, input **n** for **Configure this as a Shared Drive (Team Drive)?**

```sh
2022/03/10 22:20:23 NOTICE: Log in and authorize rclone for access
2022/03/10 22:20:23 NOTICE: Waiting for code...
2022/03/10 22:20:31 NOTICE: Got code
Configure this as a Shared Drive (Team Drive)?

y) Yes
n) No (default)
y/n> n
```

For last option, just input **y** to accept all previous config

```sh
--------------------
y) Yes this is OK (default)
e) Edit this remote
d) Delete this remote
y/e/d> y
```

Finallly, input **q** to quit the RClone interactive config shell

### Mount

First, create folder to be used as mount point (owned by non-root users):

```sh
$ sudo mkdir -p /mnt/gdrive
$ sudo chmod -Rf 755 /mnt/gdrive
$ sudo chown -Rf $USER:users /mnt/gdrive
```

Then try to mount using simple command:

```sh
$ rclone mount google-drive:/ /mnt/gdrive
```

It will run rclone and mount the Google Drive contents.

For much more complete command, you can use this instead (please adjust your user home directory):

```sh
$ rclone mount --config=/home/achmaday/.config/rclone/rclone.conf \
--stats=0 --checkers=8 --no-modtime --drive-use-trash --allow-non-empty  \
--cache-tmp-upload-path=/tmp/rclone/upload --cache-chunk-path=/tmp/rclone/chunks \
--cache-workers=4 --cache-writes --dir-cache-time=60m --cache-info-age=60m \
--cache-dir=/tmp/rclone/vfs --cache-db-path=/tmp/rclone/db \
google-drive:/ /mnt/gdrive
```

### Unmount

To unmount RClone mount point directory, simply use regular unmount command:

```sh
$ umount /mnt/gdrive
```

The running RClone will automatically stopped

## Startup Services

Now we can run some Systemd service at boot to mount Google Drive using RClone.

Some advantages auto start using system unit:
- [x] Systemd widely adopted as init system
- [x] Can be controlled and monitored by Systemd
- [x] Systemd unit can run as non-root user from same init system
- [x] Can wait for network online (in this example using NetworkManager service)
- [ ] ~~Everyone love Systemd~~ Some people are just idiot

### Systemd Unit

Save these text as **rclone.service**.
Adjust user home folder, mount point folder, and user/group name.

```
[Unit]
Description=RClone for Google Drive
Wants=network-online.target
After=network-online.target
AssertPathIsDirectory=/mnt/gdrive

[Service]
Type=simple
ExecStart=/usr/bin/rclone mount \
    --config=/home/achmaday/.config/rclone/rclone.conf \
    --stats=0 --checkers=8 --no-modtime --drive-use-trash --allow-non-empty  \
    --cache-tmp-upload-path=/tmp/rclone/upload --cache-chunk-path=/tmp/rclone/chunks \
    --cache-workers=4 --cache-writes --dir-cache-time=60m --cache-info-age=60m \
    --cache-dir=/tmp/rclone/vfs --cache-db-path=/tmp/rclone/db \
    google-drive:/ /mnt/gdrive
ExecStop=/usr/bin/umount /mnt/gdrive
Restart=always
RestartSec=10
TimeoutSec=45
User=achmaday
Group=users

[Install]
WantedBy=multi-user.target
```

Copy this file using command:

```sh
$ sudo cp -f rclone.service /usr/lib/systemd/system/
```

Then reload systemd using command:

```sh
$ sudo systemctl daemon-reload
```

### Service Control

To run test the service, issue command:

```sh
$ sudo systemctl start rclone.service
```

Check mount point contents:

```sh
$ ls -l /mnt/gdrive
```

To stop and mount:

```sh
$ sudo systemctl stop rclone.service
```

### Service Autostart

For autostart at boot, enable the service unit (along with NetworkManager and it's online wait service)

```sh
$ sudo systemctl enable NetworkManager.service
$ sudo systemctl enable rclone.service
```

Now you can reboot and RClone will automatically mount the Google Drive if the system online.

