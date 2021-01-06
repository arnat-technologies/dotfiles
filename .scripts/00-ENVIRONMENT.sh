#!/bin/zsh
echo ">>> EXPORTING VARIABLES"
export DOTFILES_DIR="/home/node/.user/dotfiles"
export SCRIPTS_DIR="$DOTFILES_DIR/.scripts"
export TARGET_HOME='/home/node'
export SILENT_INSTALL=true

echo ">>> Linking Files & Setting initial variables"
. "$SCRIPTS_DIR/01-config.sh"
. "$SCRIPTS_DIR/03-helpers.sh"
. "$SCRIPTS_DIR/04-symlink-files.sh"

print_success ">>> READY FOR INSTALLING..."

