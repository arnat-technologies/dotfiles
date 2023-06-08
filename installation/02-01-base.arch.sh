#!/bin/bash

ADDITIONAL_SETTINGS(){
  ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime
  hwclock --systohc
  locale-gen

  echo $_HOSTNAME > /etc/hostname;
  echo "127.0.1.1	$_HOSTNAME.localdomain	$_HOSTNAME" >> /etc/hosts
}

install_yay() {
  cat $DOTFILES/scripts/config/yay | sudo -i -u $USER zsh
}
