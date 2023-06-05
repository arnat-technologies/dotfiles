#!/bin/bash

. $DOTFILES/scripts/config/linux.sh

new_user_folder
install_dotfiles

chsh -s /bin/zsh # ZSH as default

echo "" >~/.gitconfig.local

psuccess ":: [Setting]    |  Linux {done}"
