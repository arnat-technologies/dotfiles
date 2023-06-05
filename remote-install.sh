#!/bin/bash

# [Author] Arnat Technologies [https://www.arnat.digital/]

cd /tmp
curl -OL https://github.com/arnat-technologies/dotfiles/archive/prd.zip
rm -rf /tmp/dotfiles-prd
unzip -qq prd.zip
rm -rf prd.zip
cd /tmp/dotfiles-prd
rm -rf .git
DOTFILES=/tmp/dotfiles-prd
. $DOTFILES/scripts/print.sh

ask_for_confirmation "symlink only?"
if answer_is_yes; then
  . $DOTFILES/scripts/symlink.sh
  exit 1
fi

PS3='Select distro: '
options=("WSL Arch" "Arch" "Ubuntu" "OSX" "Quit")
select opt in "${options[@]}"; do
  case $opt in
  "WSL Arch")
    ask_for_confirmation "preinstallation?"
    if answer_is_yes; then
      . $DOTFILES/scripts/config/pre.wsl-arch.sh
    else
      . $DOTFILES/scripts/config/post.wsl-arch.sh
    fi
    break
    ;;
  "Arch")
    . $DOTFILES/scripts/config/pre.arch.sh
    break
    ;;
  "Ubuntu")
    ask_for_confirmation "preinstallation?"
    if answer_is_yes; then
      . $DOTFILES/scripts/config/pre.ubuntu.sh
    else
      . $DOTFILES/scripts/config/post.ubuntu.sh
    fi
    break
    ;;
  "OSX")
    ask_for_confirmation "preinstallation?"
    if answer_is_yes; then
      . $DOTFILES/scripts/config/pre.osx.sh
    else
      . $DOTFILES/scripts/config/post.osx.sh
    fi
    break
    ;;
  "Quit")
    break
    ;;
  *) echo "invalid option $REPLY" ;;
  esac
done
