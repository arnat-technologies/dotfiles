#!/bin/zsh

echo ">>> Setting Variables"
[[ -z "$USER" ]] && USER=rsurj

echo ">>> EXPORTING VARIABLES"
export USER_DOTFILE=$USER
export DOTFILES_DIR="~/.user/dotfiles"
export SCRIPTS_DIR="$DOTFILES_DIR/.scripts"

echo ">>> CREATING .user FOLDER IF DOESN'T EXIST"
[[ ! -d "~/.user" ]] && mkdir -p "~/.user"

echo ">>> CLONING DOTFILES"
cd ~/.user
rm -rf dotfiles
git clone https://github.com/rsurjano/dotfiles.git

echo ">>> CREATED DOTFILES"
