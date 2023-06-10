#!/bin/bash

pinfo ":: [Setting]    |  OSX"

. $DOTFILES/scripts/config/pre.linux.sh
. $DOTFILES/scripts/config/osx.sh

install_brew

psuccess ":: [Setting]    |  OSX {done}"
