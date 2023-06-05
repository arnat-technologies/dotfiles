#!/bin/bash

pinfo ":: [Setting]    |  Arch"
. $DOTFILES/scripts/config/pre.arch.sh

pinfo ":: [Setting]    |  WSL Arch"

pacman -R fakeroot-tcp --noconfirm
pacman -S base-devel --noconfirm
pacman -S binutils --noconfirm

psuccess ":: [Setting]    |  WSL Arch {done}"
