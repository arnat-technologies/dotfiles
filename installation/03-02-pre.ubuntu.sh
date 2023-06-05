#!/bin/bash

pinfo ":: [Setting]    |  Ubuntu"
. $DOTFILES/scripts/config/ubuntu.sh
. $DOTFILES/scripts/config/pre.linux.sh

sudo apt update
install_from_file apt

psuccess ":: [Setting]    |  Ubuntu {done}"
