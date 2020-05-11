# REGISTERING HELPERS
source ./00-helpers.sh
print_info ">>> BOOTSTRAPING"

print_info ">>> CREATING BASE STRUCTURE"
source ./00-structure.sh

print_info ">>> GOING TO DOTFILES FOLDER"
cd $DOTFILES_DIR

print_info ">>> SYMLINKING DOTFILES"
source ./00-symlink-files.sh

print_success ">>> READY FOR INSTALLING..."
