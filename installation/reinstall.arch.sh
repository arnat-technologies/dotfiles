#!/bin/bash

# source <(curl -s https://raw.githubusercontent.com/arnat-technologies/dotfiles/prd/installation/02-00-reinstall.arch.sh?$(date +%s))

cd /tmp
curl -OL https://github.com/arnat-technologies/dotfiles/archive/prd.zip
rm -rf /tmp/dotfiles-prd
unzip -qq prd.zip
rm -rf prd.zip
cd /tmp/dotfiles-prd
rm -rf .git
DOTFILES=/tmp/dotfiles-prd

. $DOTFILES/installation/post.linux.sh

CLEAN_DOTFILES
INSTALL_DOTFILES

. $DOTFILES/installation/pre.linux.sh
. $DOTFILES/installation/base.arch.sh

INSTALL_FROM_FILE yay-recommended
INSTALL_EACH_FROM_FILE yay

. $DOTFILES/scripts/symlink.sh
