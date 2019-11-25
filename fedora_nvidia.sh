#!/bin/bash
# this script convert Fedora to "game fedora with nvidia" 
# and fix "waiting for device initiasation" at boot stage
if ! [ $(id -u) = 0 ]; then
   echo "This script need to be run under root"
   sudo $0 $@
   exit
fi
dnf -y install fedora-workstation-repositories
dnf -y config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
dnf -y config-manager --set-enabled rpmfusion-nonfree-steam
dnf -y install akmod-nvidia steam
echo "blacklist i2c_nvidia_gpu" > /etc/modprobe.d/nvidia.conf
echo "blacklist nouveau" >> /etc/modprobe.d/nvidia.conf
dnf -y remove xorg-x11-drv-nouveau
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img
dracut /boot/initramfs-$(uname -r).img $(uname -r)
