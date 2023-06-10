#!/bin/bash

. $DOTFILES/installation/02-02-pre.arch.sh

PARTITION_UEFI

CORE_ARCH_PACKAGES_UEFI
  
SAVE_PARTITIONS_TO_DEVICE

if [[ -z ${_UEFI} ]]; then
    BOOT_ARCH_INSTALLATION
else
    BOOT_ARCH_UEFI_INSTALLATION
fi

{
  echo root:root | chpasswd
} | arch-chroot /mnt

{
  cd /tmp
  curl -OL https://github.com/arnat-technologies/dotfiles/archive/prd.zip
  rm -rf /tmp/dotfiles-prd
  unzip -qq prd.zip
  rm -rf prd.zip
  cd /tmp/dotfiles-prd
  rm -rf .git
  export DOTFILES=/tmp/dotfiles-prd

  . $DOTFILES/installation/02-03-post.arch.sh
} | arch-chroot -u $_USER /mnt
