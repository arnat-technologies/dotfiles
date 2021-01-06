#!/bin/zsh

echo ">>> Linking Files & Setting initial variables"
. "$SCRIPTS_DIR/01-config.sh"
. "$SCRIPTS_DIR/03-helpers.sh"
. "$SCRIPTS_DIR/04-symlink-files.sh"

print_success ">>> READY FOR INSTALLING..."

