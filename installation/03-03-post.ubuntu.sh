#!/bin/bash

pinfo ":: [Setting]    |  Ubuntu"
. $DOTFILES/scripts/config/ubuntu.sh
. $DOTFILES/scripts/config/post.linux.sh

sudo apt update
INSTALL_FROM_FILE apt-recommended

# ask_for_confirmation "copy id_rsa?"
# if answer_is_yes ; then ssh_manual_copy_id_ubuntu; fi

pinfo ":: [Settings]    |  ssh"
sudo ssh-keygen -A
# init_ssh_config
# sudo service ssh restart

pinfo ":: [Software]    |  exo"
install_exa

pinfo ":: [Software]    |  starship"
install_starship

pinfo ":: [Software]    |  fzf"
install_fzf
# install_navi

pinfo ":: [Software]    |  beavr"
install_beavr
# install_navi

pinfo ":: [Software]    |  fx"
install_fx

pinfo ":: [Software]    |  lazygit"
install_lazygit

export DOTFILES=$HOME/.user/dotfiles

psuccess ":: [Setting]    |  Ubuntu {done}"
