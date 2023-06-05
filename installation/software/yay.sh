#!/bin/bash

yay_arch() {
    pinfo "@yay @arch #software @start" 

    git clone https://aur.archlinux.org/yay.git
    chown -R $USER yay
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay

    psuccess "@yay @arch #software @done"
}
