#!/bin/bash

timedatectl set-ntp true

PARTITION_UEFI() {
  parted --script /dev/sda \
  mklabel gpt \
  mkpart "EFI" fat32 1MiB 500MiB \
  set 1 esp on \
  mkpart "ROOT" ext4 500MiB 40GiB \
  mkpart "SWAP" linux-swap 40GiB 48GiB \
  mkpart "HOME" ext4 48GiB 100%

  export MAIN_DEVICE=/dev/sda
  export EFI_DEVICE="/dev/sda1" 
  export ROOT_DEVICE="/dev/sda2"
  export SWAP_DEVICE="/dev/sda3"
  export HOME_DEVICE="/dev/sda4"

  mkfs.fat -F32 $EFI_DEVICE
  mkfs.ext4 $ROOT_DEVICE
  mkfs.ext4 $HOME_DEVICE
  mkswap $SWAP_DEVICE

  swapon $SWAP_DEVICE
  mount $ROOT_DEVICE /mnt 
  mount --mkdir $HOME_DEVICE /mnt/home
  mount --mkdir $EFI_DEVICE /mnt/boot/efi
}

SAVE_PARTITIONS_TO_DEVICE(){
  genfstab -Up /mnt >> /mnt/etc/fstab
}

BOOT_LINUX(){
{
  grub-mkconfig -o /boot/grub/grub.cfg
} | chroot /mnt
}

BOOT_LINUX_INSTALLATION(){
{
  grub-install $MAIN_DEVICE
} | chroot /mnt
BOOT_LINUX
}

BOOT_LINUX_UEFI_INSTALLATION() {
{
  grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable
} | chroot /mnt
BOOT_LINUX
}
