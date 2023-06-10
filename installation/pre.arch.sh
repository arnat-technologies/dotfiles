#!/bin/bash

. $DOTFILES/installation/00-01-linux.sh
. $DOTFILES/installation/00-02-pre.linux.sh
. $DOTFILES/installation/02-01-base.arch.sh

CORE_ARCH_PACKAGES(){
  yes | pacstrap /mnt base base-devel networkmanager grub linux linux-firmware dhcpcd wpa_supplicant dialog git sudo zsh unzip openssh
}

CORE_ARCH_PACKAGES_UEFI(){
  yes | pacstrap /mnt efibootmgr
  CORE_ARCH_PACKAGES
}

BOOT_ARCH(){
  {
    grub-mkconfig -o /boot/grub/grub.cfg
  } | arch-chroot /mnt
}

BOOT_ARCH_INSTALLATION() {
  {
    grub-install $MAIN_DEVICE
  } | arch-chroot /mnt
  BOOT_ARCH
}

BOOT_ARCH_UEFI_INSTALLATION() {
  {
    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable
  } | arch-chroot /mnt
  BOOT_ARCH
}
