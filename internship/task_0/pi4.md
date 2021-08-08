### Disk Install

##### prepare disk

~~~
sudo fdisk -l
export DEVDISK='/dev/sdb'

sudo parted ${DEVDISK} mklabel msdos

yes | sudo parted ${DEVDISK} mkpart primary 0% 200
yes | sudo parted ${DEVDISK} mkpart primary 200 100%
yes | sudo parted ${DEVDISK} set 1 lba on
yes | sudo parted ${DEVDISK} set 1 boot on

yes | sudo mkfs.vfat ${DEVDISK}1
yes | sudo mkfs.ext4 ${DEVDISK}2
~~~

##### download image

~~~
wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz
~~~

##### deploy image

~~~
sudo fdisk -l
export DEVDISK='/dev/sdb'

sudo mkdir -p /mnt/{boot,root}
sudo mount ${DEVDISK}1 /mnt/boot
sudo mount ${DEVDISK}2 /mnt/root

mkdir -p armv7h/
cd armv7h/

sudo bsdtar -xpf ../ArchLinuxARM-rpi-2-latest.tar.gz -C /mnt/root
sudo sync

sudo mv -vf /mnt/root/boot/* /mnt/boot/
sudo sync

sudo umount /mnt/root /mnt/boot
~~~

--------------------------------------------------------------------------------

### Qemu run

##### mount disk

~~~
sudo fdisk -l
export DEVDISK='/dev/sdb'

sudo mount ${DEVDISK}2 /mnt/root
sudo mount ${DEVDISK}1 /mnt/root/boot
~~~

##### copy qemu-arm-static

~~~
sudo cp -vf /usr/bin/qemu-arm-static /mnt/root/usr/bin/
~~~

##### arch-chrooting

~~~
sudo arch-chroot /mnt/root /bin/bash

uname -a

exit
~~~

--------------------------------------------------------------------------------

### Install packages

##### initialize pacman (qemu-chroot)

~~~
pacman-key --init
pacman-key --populate archlinuxarm
~~~

##### prepare database

~~~
mkdir -p databases/;cd databases/
echo "
http://mirror.archlinuxarm.org/armv7h/core/core.db
http://mirror.archlinuxarm.org/armv7h/core/core.files
http://mirror.archlinuxarm.org/armv7h/extra/extra.db
http://mirror.archlinuxarm.org/armv7h/extra/extra.files
http://mirror.archlinuxarm.org/armv7h/community/community.db
http://mirror.archlinuxarm.org/armv7h/community/community.files
http://mirror.archlinuxarm.org/armv7h/alarm/alarm.db
http://mirror.archlinuxarm.org/armv7h/alarm/alarm.files
http://mirror.archlinuxarm.org/armv7h/aur/aur.db
http://mirror.archlinuxarm.org/armv7h/aur/aur.files
" > ../dbase.txt
wget -i ../dbase.txt
cd ../

sudo rsync -avh databases/ /mnt/root/var/lib/pacman/sync/
~~~

##### generate upgrade packages urls (qemu-chroot)

~~~
pacman -Sup > /home/alarm/upgrade_pkgs.txt
~~~

##### prepare upgrade packages

~~~
cp -vf /mnt/root/home/alarm/upgrade_pkgs.txt ./
mkdir -p packages/official/;cd packages/official/
wget -i ../../upgrade_pkgs.txt
cd ../../

sudo rsync -avh packages/official/ /mnt/root/var/cache/pacman/pkg/
~~~

##### copy install packages list

~~~
cp -vf ../pkg_*.txt /mnt/root/home/alarm/pkglist.txt
~~~

##### upgrade packages (qemu-chroot)

~~~
sed -i "s#= Required DatabaseOptional#= Never#g" /etc/pacman.conf
sed -i "s#= Optional TrustAll#= Never#g" /etc/pacman.conf
sed -i "s#= Optional#= Never#g" /etc/pacman.conf

pacman -Su --noconfirm
~~~

##### generate install packages urls (qemu-chroot)

~~~
pacman -Sp $(cat /home/alarm/pkglist.txt) > /home/alarm/install_pkgs.txt
~~~

##### prepare install packages

~~~
cp -vf /mnt/root/home/alarm/install_pkgs.txt ./
mkdir -p packages/official/;cd packages/official/
wget -i ../../install_pkgs.txt
cd ../../

sudo rsync -avh packages/official/ /mnt/root/var/cache/pacman/pkg/
~~~

##### install packages (qemu-chroot)

~~~
sed -i "s#= Required DatabaseOptional#= Never#g" /etc/pacman.conf
sed -i "s#= Optional TrustAll#= Never#g" /etc/pacman.conf
sed -i "s#= Optional#= Never#g" /etc/pacman.conf

pacman -S --noconfirm $(cat /home/alarm/pkglist.txt)
~~~

--------------------------------------------------------------------------------

### Global Configuration

##### set hostname (qemu-chroot)

~~~
echo "alarmrpi" > /etc/hostname
~~~

##### silent cli (qemu-chroot)

~~~
sed -i '$s/$/ audit=0 quiet loglevel=0/' /boot/cmdline.txt
echo 'kernel.printk = 3 3 3 3' > /etc/sysctl.d/20-quiet-printk.conf
~~~

##### generate locale (qemu-chroot)

~~~
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "en_US ISO-8859-1" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
~~~

##### sudoers no password (qemu-chroot)

~~~
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
~~~

##### disable passwords (qemu-chroot)

~~~
passwd -d root
passwd -d alarm
~~~

##### console font (qemu-chroot)

~~~
echo "FONT=ter-112n
FONT_MAP=8859-2
" > /etc/vconsole.conf
~~~

##### enable network manager (qemu-chroot)

~~~
systemctl disable dhcpd4
systemctl disable wpa_supplicant
systemctl disable systemd-networkd
systemctl enable NetworkManager
~~~

##### enable ssh server (qemu-chroot)

~~~
mkdir -p /etc/ssh
echo "
PermitRootLogin yes
AuthorizedKeysFile .ssh/authorized_keys
PermitEmptyPasswords yes
ChallengeResponseAuthentication no
UsePAM yes
PrintMotd no
Subsystem sftp /usr/lib/ssh/sftp-server
" > /etc/ssh/sshd_config

systemctl enable sshd.service
~~~

### CLI Configuration

##### cli autologin (qemu-chroot)

~~~
mkdir -p /etc/systemd/system/getty@tty1.service.d/

echo "[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin alarm --noclear %I 38400 linux
" > /etc/systemd/system/getty@tty1.service.d/autologin.conf
~~~

### MATE Configuration

##### lightdm autologin

~~~
systemctl enable lightdm

groupadd -r autologin
gpasswd -a alarm autologin

echo -e "[Seat:*]
pam-service=lightdm
pam-autologin-service=lightdm-autologin
allow-guest=false
session-wrapper=/etc/lightdm/Xsession
greeter-session=lightdm-gtk-greeter
autologin-user-timeout=0
autologin-session=mate" > /etc/lightdm/lightdm.conf

echo -e "autologin-user=alarm" >> /etc/lightdm/lightdm.conf
~~~

--------------------------------------------------------------------------------

### Finish

##### clean-up package cache (qemu-chroot)

~~~
rm -vf /home/alarm/{install_pkgs.txt,pkglist.txt,upgrade_pkgs.txt}
rm -vf /var/cache/pacman/pkg/*

exit
~~~

##### umount disk

~~~
sudo umount /mnt/root/boot/
sudo umount /mnt/root/
~~~

##### clear url list files

~~~
rm -vf dbase.txt install_pkgs.txt upgrade_pkgs.txt
~~~

--------------------------------------------------------------------------------

### Additional Configuration

##### login ssh

~~~
rm -r ~/.ssh/

ssh alarm@10.124.4.150

hwclock --show --verbose;date
sudo date -s "9 JUL 2021 07:00:00"

exit
~~~

##### WiFi Connection

~~~
sudo nmcli radio wifi on

sudo nmcli dev wifi
sudo iwlist wlan0 scan | grep SSID

sudo nmcli --ask dev wifi connect CobaMQTT
sudo nmcli dev wifi connect CobaMQTT password "cobamqtt"

sudo nmcli con
sudo nmcli con show CobaMQTT
sudo nmcli con delete CobaMQTT
~~~

##### GUI Program at start

~~~
rm ~/.xinitrc
echo "startx /usr/bin/python /home/alarm/tkfree.py" >> ~/.bashrc
~~~

~~~
# add to .bashrc
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "SSH Login"
else
    startx /usr/bin/python /home/alarm/tkfree.py &> /dev/null
    #startx /usr/bin/python /home/alarm/tkfree.py -- -logverbose 6 &> ~/xorg.log
fi
~~~

##### Xorg no blank

~~~
echo 'Section "ServerFlags"
    Option "StandbyTime" "0"
    Option "SuspendTime" "0"
    Option "OffTime" "0"
    Option "BlankTime" "0"
EndSection' >  /etc/X11/xorg.conf.d/noblank.conf
~~~

##### HDMI LCD 1024x600 Waveshare (qemu-chroot)

~~~
echo "
max_usb_current=1
hdmi_group=2
hdmi_mode=87
hdmi_cvt 1024 600 60 6 0 0 0" >> /boot/config.txt
~~~

##### Waveshare 3.5 LCD (qemu-chroot)
- https://github.com/waveshare/LCD-show/
- https://whitedome.com.au/download/Overlays/
- https://github.com/swkim01/waveshare-dtoverlays/

~~~
# in actual running rpi unit
wget https://raw.githubusercontent.com/swkim01/waveshare-dtoverlays/master/waveshare35a.dts
dtc -@ -Hepapr -I dts -O dtb -o waveshare35a.dtbo waveshare35a.dts
~~~

~~~
cp -f /home/alarm/waveshare35a.dtbo /boot/overlays/

echo "
dtparam=i2c_arm=on
dtparam=spi=on
dtoverlay=waveshare35a:rotate=270,swapxy=1" >> /boot/config.txt

# workaround bug for failed boot without HDMI
echo "hdmi_force_hotplug=1" >> /boot/config.txt

# ' fbcon=map:10' confusing
sed -i '$s/$/ fbcon=font:ProFont6x11/' /boot/cmdline.txt

groupadd -fr video
gpasswd -a alarm video
gpasswd -a alarm tty

# redirect xorg framebuffer output
# dont use this for Pi-4 without any HDMI out
#sed -i "s#/dev/fb0#/dev/fb1#g" /etc/X11/xorg.conf.d/99-fbturbo.conf
~~~

##### Waveshare 3.5 Touchscreen (qemu-chroot)

~~~
#startx /usr/bin/xinput_calibrator | tee calib.log
#less calib.log

# invert Y
echo 'Section "InputClass"
    Identifier          "libinput touchscreen"
    MatchIsTouchScreen  "on"
    MatchDevicePath     "/dev/input/event*"
    Driver              "libinput"
    Option "TransformationMatrix" "1 0 0 0 -1 1 0 0 1"
EndSection' > /etc/X11/xorg.conf.d/99-calibration.conf
~~~

##### Enable Audio (qemu-chroot)

~~~
moc sox twolame

blueman bluez bluez-utils

python-docutils
python-pexpect
python-psutil

pulseaudio-alsa
pulseaudio-bluetooth
alsa-lib alsa-plugins
alsa-utils alsa-firmware
~~~

~~~
# enable kernel audio feature
echo "dtparam=audio=on" >> /boot/config.txt

# if using audio jack 3.5mm
echo "audio_pwm_mode=2" >> /boot/config.txt

# if using audio over HDMI
echo "hdmi_drive=2" >> /boot/config.txt
~~~

###### Bluetooth modules for Pi-3
- https://aur.archlinux.org/packages/bluez-utils-compat/
- https://aur.archlinux.org/packages/pi-bluetooth/

~~~
systemctl enable bluetooth
sed -i "s#console=ttyAMA0,115200 ##g" /boot/cmdline.txt
echo "dtparam=krnbt=on" >> /boot/config.txt
echo "enable_uart=0" >> /boot/config.txt

# Bluetooth modules for Pi-3
systemctl enable brcm43438
BT_AUDIO='btc_mode=1\nbtc_params8=0x4e20\nbtc_params1=0x7530'
echo -e $BT_AUDIO >> /usr/lib/firmware/updates/brcm/brcmfmac43430-sdio.txt
echo -e $BT_AUDIO >> /usr/lib/firmware/updates/brcm/brcmfmac43455-sdio.txt
~~~

~~~
# disable wifi to improve
# in actual running RPi
sudo nmcli radio wifi off
sudo reboot
~~~

~~~
# bluetoothctl interactive
# in actual running RPi
bluetoothctl
> power on
> agent on
> scan on

# make sure headphone in pairing mode
# select non-LE name
#journalctl --unit=bluetooth -f
#pulseaudio -k;pulseaudio --start
> pair 04:52:C7:5E:BA:B5
> connect 04:52:C7:5E:BA:B5
> trust 04:52:C7:5E:BA:B5

# remove a paired devices
> paired-devices
> remove 04:52:C7:5E:BA:B5

# quit from shell
> quit
~~~
