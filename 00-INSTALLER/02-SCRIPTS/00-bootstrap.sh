# REGISTERING HELPERS
source ./00-helpers.sh

print_info ">>> CREATING BASE STRUCTURE"
source ./00-structure.sh

print_info ">>> EXPORTING USER DOTFILES FOLDER"
export USER_DOTFILE=$(whoami)
export DOTFILES_DIR="$DOTFILES_DIR/$USER_DOTFILE/dotfiles"

print_info ">>> GOING TO DOTFILES FOLDER"
cd $DOTFILES_DIR

print_info ">>> REGISTERING INSTALLER FUNCTIONS"
source ./00-functions.sh

print_info ">>> SYMLINKING DOTFILES"
source ./00-symlink-files.sh

print_success ">>> READY FOR INSTALLING..."
