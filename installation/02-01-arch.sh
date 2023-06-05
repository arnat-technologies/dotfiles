#!/bin/bash

install_yay() {
  cat $DOTFILES/scripts/config/yay | sudo -i -u $USER zsh
}

pacman_repo() {
  "[archlinuxfr]
  SigLevel = Never
  Server = http://repo.archlinux.fr/$arch
" >>/etc/pacman.conf
}

pacman_refresh() {
  gpgconf --kill all
  pacman-key --init
  pacman-key --populate
  pacman-key --refresh-keys
  pacman -Sy archlinux-keyring --noconfirm
}
