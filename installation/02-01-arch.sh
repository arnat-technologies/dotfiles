#!/bin/bash


install_yay() {
  cat $DOTFILES/scripts/config/yay | sudo -i -u $USER zsh
}

PACMAN_INIT() {
# "[archlinuxfr]
#  SigLevel = Never
#  Server = http://repo.archlinux.fr/$arch
# " >>/etc/pacman.conf

  # gpgconf --kill all
  pacman-key --init
  pacman-key --populate
  pacman-key --refresh-keys
  pacman -Sy archlinux-keyring --noconfirm

  pacman -Syyu --noconfirm
}

PARTITION_UEFI() {
  parted --script /dev/sda \
  mklabel gpt \
  mkpart "EFI" fat32 1MiB 500MiB \
  set 1 esp on \
  mkpart "ROOT" ext4 500MiB 40GiB \
  mkpart "SWAP" linux-swap 40GiB 48GiB \
  mkpart "HOME" ext4 48GiB 100%

  EFI_DEVICE="/dev/sda1" 
  ROOT_DEVICE="/dev/sda2"
  SWAP_DEVICE="/dev/sda3"
  HOME_DEVICE="/dev/sda4"

  mkfs.fat -F32 $EFI_DEVICE
  mkfs.ext4 $ROOT_DEVICE
  mkfs.ext4 $HOME_DEVICE
  mkswap $SWAP_DEVICE

  swapon $SWAP_DEVICE
  mount $ROOT_DEVICE /mnt 
  mount --mkdir $HOME_DEVICE /mnt/home
  mount --mkdir $EFI_DEVICE /mnt/boot/efi
}

BOOT_UEFI_INSTALLATION() {
{
  grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable
  grub-mkconfig -o /boot/grub/grub.cfg
} | arch-chroot /mnt
}

CORE_PACKAGES(){
  yes | pacstrap /mnt base base-devel networkmanager grub linux linux-firmware dhcpcd wpa_supplicant dialog
}

CORE_PACKAGES_UEFI(){
  yes | pacstrap /mnt efibootmgr
  CORE_PACKAGES
}

alias SAVE_PARTITIONS_TO_DEVICE="genfstab -Up /mnt >> /mnt/etc/fstab"

ADDITIONAL_SETTINGS(){
  ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime
  hwclock --systohc
  locale-gen

  echo $_HOSTNAME > /etc/hostname
  echo "127.0.1.1	$_HOSTNAME.localdomain	$_HOSTNAME" >> /etc/hosts
}


  # echo "LANG=en_GB.UTF-8" > /etc/locale.conf
  # echo "KEYMAP=us" > /etc/vconsole.conf
