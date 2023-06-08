#!/bin/bash

pinfo ":: [Setting]    |  Ubuntu"
. $DOTFILES/scripts/config/ubuntu.sh
. $DOTFILES/scripts/config/pre.linux.sh

sudo apt update
INSTALL_FROM_FILE apt

psuccess ":: [Setting]    |  Ubuntu {done}"
