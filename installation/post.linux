#!/bin/bash

CLEAN_DOTFILES() {
  [[ ! -d "$HOME/.user" ]] && mkdir -p "$HOME/.user"
  cd $HOME/.user
  rm -rf $HOME/.user/dotfiles
}

INSTALL_DOTFILES() {
  git clone https://github.com/arnat-technologies/dotfiles.git $HOME/.user/dotfiles
  export DOTFILES=$HOME/.user/dotfiles
}

chsh -s /bin/zsh # ZSH as default

# echo "" >~/.gitconfig.local

# echo "LANG=en_GB.UTF-8" > /etc/locale.conf
# echo "KEYMAP=us" > /etc/vconsole.conf
