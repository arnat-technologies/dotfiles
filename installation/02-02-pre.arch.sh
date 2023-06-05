#!/bin/bash

pinfo ":: [Setting]    |  Linux"
. $DOTFILES/scripts/config/pre.linux.sh
. $DOTFILES/scripts/config/arch.sh

pacman_repo
pacman_refresh
pacman -Syyu --noconfirm

install_yay

psuccess ":: [Setting]    |  Arch {done}"
