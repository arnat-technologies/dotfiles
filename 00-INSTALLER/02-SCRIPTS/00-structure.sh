print_info ">>> GETTING USER NAME"
export USER_DOTFILE=$(whoami)

print_info ">>> EXPORTING USER DOTFILES FOLDER"
export DOTFILES_DIR="/$USER_DOTFILE/dotfiles"

print_info ">>> CLEANING UP"
rm -rf "$HOME/dotfiles"

print_info ">>> CREATING FOLDER $USER_DOTFILE IF DOESN'T EXIST"
[[ ! -d "/$USER_DOTFILE" ]] && mkdir "/$USER_DOTFILE"

print_info ">>> ASSIGNING PERMISSIONS "
chown -R "$USER_DOTFILE:$USER_DOTFILE" "/$USER_DOTFILE"
mkdir $DOTFILES_DIR

print_info ">>> COPYING FILE TO $DOTFILES_DIR"
cd ../../
PARENT_PATH=$(pwd)
cp -R $(pwd) $DOTFILES_DIR

print_success ">>> CREATED USER STRUCTURE"
