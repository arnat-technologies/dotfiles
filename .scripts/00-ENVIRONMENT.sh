#!/bin/zsh
echo ">>> EXPORTING VARIABLES"
export TARGET_HOME=$HOME
export DOTFILES_DIR="$TARGET_HOME/.user/dotfiles"
export SCRIPTS_DIR="$DOTFILES_DIR/.scripts"
export SILENT_INSTALL=true

echo "\nTARGET_HOME $TARGET_HOME"
echo "DOTFILES_DIR $DOTFILES_DIR"
echo "SCRIPTS_DIR $SCRIPTS_DIR"
echo "SILENT_INSTALL $SILENT_INSTALL"

echo ">>> Linking Files & Setting initial variables"
. "$SCRIPTS_DIR/03-helpers.sh"
. "$SCRIPTS_DIR/04-symlink-files.sh"

print_success ">>> READY FOR INSTALLING..."
