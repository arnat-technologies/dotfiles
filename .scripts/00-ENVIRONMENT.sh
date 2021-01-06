#!/bin/zsh
echo ">>> EXPORTING VARIABLES"
export DOTFILES_DIR="$HOME/.user/dotfiles"
export SCRIPTS_DIR="$DOTFILES_DIR/.scripts"

echo ">>> Linking Files & Setting initial variables"
sh "$SCRIPTS_DIR/01-config.sh"
sh "$SCRIPTS_DIR/02-bootstrap.sh"
