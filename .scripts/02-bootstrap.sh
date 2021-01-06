#!/bin/zsh

echo ">>> BOOTSTRAPPING"

sh "$SCRIPTS_DIR/03-helpers.sh"
sh "$SCRIPTS_DIR/04-symlink-files.sh"

print_success ">>> READY FOR INSTALLING..."
