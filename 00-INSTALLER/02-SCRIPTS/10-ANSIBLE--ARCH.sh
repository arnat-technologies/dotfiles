print_info ">>> RUNNING ANSIBLE FOR ARCH LINUX..."
cd $DOTFILES_DIR/00-INSTALLER/01-ANSIBLE
ansible-playbook -i hosts osx/playbook.yml --become --ask-become-pass
