#!/bin/zsh

print_info ">>> INSTALING BREW"
[ ! -f "`which brew`" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
print_info ">>> INSTALLING PYTHON"
[ ! -f "`which python`" ] && brew install python
print_info ">>> INSTALLING PIP"
[ ! -f "`which pip`" ] && sudo easy_install pip && sudo pip install --upgrade pip
print_info ">>> INSTALLING ANSIBLE"
[ ! -f "`which ansible`" ] && brew install ansible

print_success ">> REQUIRED DEPENDENCIES ARE BEED INSTALLED"

print_info ">>> RUNNING ANSIBLE FOR OSX..."
cd $DOTFILES_DIR/00-INSTALLER/01-ANSIBLE
# ansible-playbook -i hosts osx/playbook.yml --ask-become-pass
ansible-playbook -i hosts osx/playbook.yml
