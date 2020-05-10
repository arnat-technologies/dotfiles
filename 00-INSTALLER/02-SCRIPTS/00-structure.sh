# GETTING USER NAME
local current_user=$(whoami)

# CLEANING UP
rm -rf "/$current_user/dotfiles"

# CREATING / ASSIGNING FOLDER PERMISSIONS
mkdir "/$current_user"
chown -R $current_user:users "/$current_user"

print_success ">>> CREATED USER STRUCTURE"
