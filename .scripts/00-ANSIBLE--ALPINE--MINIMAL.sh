#!/bin/zsh

source "$SCRIPTS_DIR/00-ENVIRONMENT.sh"

print_info ">>> RUNNING ANSIBLE FOR ALPINE..."

# ansible-playbook -i hosts osx/playbook.yml --become --ask-become-pass


# alias ansible='docker run -v "${PWD}":/work:ro --rm spy86/ansible:latest'
# alias ansible-playbook='docker run -v "${PWD}":/work:ro -v ~/.ansible/roles:/root/.ansible/roles -v ~/.ssh:/root/.ssh:ro --rm spy86/ansible:latest ansible-playbook'
# alias ansible-vault='docker run -v "${PWD}":/work:ro --rm spy86/ansible:latest ansible-vault'
