#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script need to be run under root"
   sudo $0 $@
   exit
fi
# here is my start up script
hostnamectl set-hostname piter
echo "127.0.0.1 piter" >> /etc/hosts
dnf -y update
dnf -y install mc bind bind-utils thunderbird
# enable my own dns
systemctl start named
systemctl enable named
# do not override /etc/resolv.conf by NM
echo "[main]" >> /etc/NetworkManager/NetworkManager.conf
echo "dns=none" >> /etc/NetworkManager/NetworkManager.conf
# override resolv.conf by our values
echo "search localdomain" > /etc/resolv.conf
echo "nameserver 127.0.0.1" >> /etc/resolv.conf
# lets fill system by useful soft
dnf -y install snapd
systemctl start snapd

# Sublime Text
dnf -y config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
dnf -y install sublime-text
#enable sshd
systemctl enable sshd
systemctl start sshd
# now snapd part
snap install telegram-desktop
snap install bitwarden 

dnf -y install fira-code-fonts
