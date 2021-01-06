#!/bin/zsh
echo ">>> EXPORTING VARIABLES"
export DOTFILES_DIR="/home/node/.user/dotfiles"
export SCRIPTS_DIR="$DOTFILES_DIR/.scripts"
export TARGET_HOME='/home/node'

echo ">>> Linking Files & Setting initial variables"
sh "$SCRIPTS_DIR/01-config.sh"
sh "$SCRIPTS_DIR/03-helpers.sh"
sh "$SCRIPTS_DIR/04-symlink-files.sh"

print_success ">>> READY FOR INSTALLING..."

