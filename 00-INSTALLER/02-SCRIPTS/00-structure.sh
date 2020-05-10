print_info ">>> GETTING USER NAME"
current_user=$(whoami)

print_info ">>> CLEANING UP"
rm -rf "$HOME/dotfiles"

print_info ">>> CREATING FOLDER $current_user IF DOESN'T EXIST"
[[ ! -d "/$current_user" ]] && mkdir "/$current_user"

chown -R "$current_user:$current_user" "/$current_user"

print_success ">>> CREATED USER STRUCTURE"
