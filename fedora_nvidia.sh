# its for gaming computer
dnf install fedora-workstation-repositories
dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
dnf config-manager --set-enabled rpmfusion-nonfree-steam
dnf install akmod-nvidia
echo "blacklist i2c_nvidia_gpu" > /etc/modprobe.d/nvidia.conf
echo "blacklist nouveau" >> /etc/modprobe.d/nvidia.conf
dnf remove xorg-x11-drv-nouveau
mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img
dracut /boot/initramfs-$(uname -r).img $(uname -r)
