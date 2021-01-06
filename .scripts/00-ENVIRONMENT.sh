#!/bin/zsh
echo ">>> EXPORTING VARIABLES"
export DOTFILES_DIR="$HOME/.user/dotfiles"
export SCRIPTS_DIR="$DOTFILES_DIR/.scripts"

echo ">>> Linking Files & Setting initial variables"
sh "$HOME/.user/dotfiles/.scripts/01-config.sh"
sh "$HOME/.user/dotfiles/.scripts/02-bootstrap.sh"
