#!/bin/zsh

echo ">>> CREATING .user FOLDER IF DOESN'T EXIST"
[[ ! -d "~/.user" ]] && mkdir -p "~/.user"

echo ">>> CLONING DOTFILES"
cd ~/.user
rm -rf dotfiles
git clone https://github.com/rsurjano/dotfiles.git

echo ">>> CREATED DOTFILES"
