#!/bin/zsh
export TARGET_HOME='/home/node'
export DOTFILES_DIR="$TARGET_HOME/.user/dotfiles"
export SCRIPTS_DIR="$DOTFILES_DIR/.scripts"
export SILENT_INSTALL=true

echo ">>> Linking Files & Setting initial variables"
. "$SCRIPTS_DIR/03-helpers.sh"
. "$SCRIPTS_DIR/04-symlink-files.sh"

print_success ">>> READY FOR INSTALLING..."

