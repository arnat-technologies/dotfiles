# GETTING USER NAME
current_user=$(whoami)

# CLEANING UP
rm -rf "$HOME/dotfiles"

# CREATING / ASSIGNING FOLDER PERMISSIONS
mkdir "/$current_user"
chown -R "$current_user:$current_user" "/$current_user"

print_success ">>> CREATED USER STRUCTURE"
