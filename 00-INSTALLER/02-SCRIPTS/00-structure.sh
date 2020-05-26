#!/bin/zsh

print_info ">>> GETTING USER NAME"
export USER_DOTFILE=rsurj

print_info ">>> EXPORTING USER DOTFILES FOLDER"
export DOTFILES_DIR="$HOME/$USER_DOTFILE/dotfiles"

print_info ">>> CREATING FOLDER $USER_DOTFILE IF DOESN'T EXIST"
[[ ! -d "$HOME/$USER_DOTFILE" ]] && mkdir "$HOME/$USER_DOTFILE"

print_info ">>> CREATING DOTFILES FOLDER"
mkdir $DOTFILES_DIR

print_info ">>> COPYING FILE TO $DOTFILES_DIR"
cd ../../
cp -R $(pwd) "$HOME/$USER_DOTFILE"

print_success ">>> CREATED USER STRUCTURE"
