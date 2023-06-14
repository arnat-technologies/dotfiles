#!/bin/bash

. $DOTFILES/installation/00-01-linux.sh
. $DOTFILES/installation/00-03-post.linux.sh
. $DOTFILES/installation/02-01-base.arch.sh

sudo sysctl -w vm.max_map_count=262144
sudo sysctl -p
cat /proc/sys/vm/max_map_count # 26214

# wsl -d docker-desktop
# sysctl -w vm.max_map_count=2621444

ENABLE_DHCP_ETHERNET() {
  sudo systemctl start NetworkManager.service
  sudo systemctl start dhcpcd.service
}

PACMAN_INIT() {
  pacman-key --init
  pacman-key --populate
  pacman-key --refresh-keys
  pacman -Sy archlinux-keyring --noconfirm
  pacman -Syyu --noconfirm
}

CLEAN_DOTFILES
INSTALL_DOTFILES

PACMAN_INIT

INSTALL_FROM_FILE yay-recommended
INSTALL_EACH_FROM_FILE yay

ENABLE_DHCP_ETHERNET
