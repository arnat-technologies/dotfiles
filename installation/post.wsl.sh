#!/bin/zsh

echo "root:root" | chpasswd
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
 
useradd -m -G wheel -s /bin/bash rsurj
echo "rsurj:rsurj" | chpasswd

sudo -u "rsurj" -i <<EOF
echo "$(whoami)"

sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Sy archlinux-keyring
sudo pacman -Su --noconfirm

sudo pacman -S git wget base-devel binutils go --noconfirm
sudo pacman -R fakeroot-tcp --noconfirm
EOF

echo "Arch.exe config --default-user rsurj"

echo "exit & reboot Arch Linux" 
