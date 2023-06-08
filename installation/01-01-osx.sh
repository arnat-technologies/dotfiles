#!/bin/bash

install_brew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  eval $(/opt/homebrew/bin/brew shellenv)
  brew tap homebrew/cask-fonts
}

install_rust() { # after brew
  rustup-init
}

install_colima() {
  brew install docker
  brew install docker-compose
  brew install kubectl
  brew install colima
  echo ">>> colima start"
}
