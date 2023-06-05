#!/bin/bash

install_exa() {
  EXA_VERSION=$(curl -s "https://api.github.com/repos/ogham/exa/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
  curl -Lo exa.zip "https://github.com/ogham/exa/releases/latest/download/exa-linux-x86_64-v${EXA_VERSION}.zip"
  unzip exa.zip -d exa
  sudo mv exa/bin/exa /usr/local/bin/exa
  rm -rf exa
  rm exa.zip
}

install_starship() {
  curl -sS https://starship.rs/install.sh | sh
}

install_fnm() {
  curl -fsSL https://fnm.vercel.app/install | bash
}

install_fx() {
  # curl -fsSL https://fx.wtf | bash
  # bash <( curl https://fx.wtf )
  # npm i -g fx 
}

install_lazygit() {
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
rm -rf lazygit.tar.gz

}

ssh_manual_copy_id_ubuntu(){
  ssh_manual_copy_id
  sudo service ssh start
  pinfo ":: [Setting]    |  PasswordAuthentication no"
}
