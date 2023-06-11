#!/bin/zsh

echo -n "user name?: "
read newuser

echo "root:root" | chpasswd
echo "%wheel ALL=(ALL) ALL" >/etc/sudoers.d/wheel

useradd -m -G wheel -s /bin/bash $newuser
echo "$newuser:$newuser" | chpasswd

sudo -u "$newuser" -i <<EOF
echo "$(whoami)"

sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Sy archlinux-keyring
sudo pacman -Su --noconfirm

sudo pacman -S git wget base-devel binutils go --noconfirm
sudo pacman -R fakeroot-tcp --noconfirm
EOF

echo "Arch.exe config --default-user $newuser"

echo "exit & reboot Arch Linux"
