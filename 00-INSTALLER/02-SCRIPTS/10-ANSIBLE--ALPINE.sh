#!/bin/bash

source ./00-INSTALLER--ALPINE.sh

print_info ">>> RUNNING ANSIBLE FOR ALPINE..."
cd $DOTFILES_DIR/00-INSTALLER/01-ANSIBLE

echo "Do you wish to run ansible for alpine?"
select yn in "Yes" "No"
case $yn in
    Yes ) ansible-playbook -i hosts osx/playbook.yml --become --ask-become-pass;;
    No ) exit;;
esac
