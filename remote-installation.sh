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
. $DOTFILES/shell/core

select os in Arch Ubuntu OSX WSL2; do
  case $os in
  "Arch")
    SELECTION=arch
    break
    ;;
  "Ubuntu")
    SELECTION=ubuntu
    break
    ;;
  "OSX")
    SELECTION=osx
    break
    ;;
  "WSL2")
    SELECTION=wsl2
    break
    ;;
  *)
    exit 0
    break
    ;;
  esac
done

ask_for_confirmation "preinstallation?"
if answer_is_yes; then
  SELECTION="pre.$SELECTION"
else
  SELECTION="post.$SELECTION"
fi

. $DOTFILES/installation/$SELECTION
