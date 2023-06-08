#!/bin/bash

. $DOTFILES/installation/00-01-linux.sh
. $DOTFILES/installation/00-03-post.linux.sh
. $DOTFILES/installation/02-01-base.arch.sh

PACMAN_INIT() {
# "[archlinuxfr]
#  SigLevel = Never
#  Server = http://repo.archlinux.fr/$arch
# " >>/etc/pacman.conf

  pacman-key --init
  pacman-key --populate
  pacman-key --refresh-keys
  pacman -Sy archlinux-keyring --noconfirm
  pacman -Syyu --noconfirm
}
 
install_cheat() {
  cd /tmp
  curl -OL https://github.com/cheat/cheat/releases/download/4.2.5/cheat-linux-amd64.gz
  gunzip cheat-linux-amd64.gz
  chmod +x cheat-linux-amd64
  sudo mv cheat-linux-amd64 /usr/local/bin/cheat
}

install_navi() {
  bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)
}

install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

install_wuzz() {
  curl -OL https://github.com/asciimoo/wuzz/releases/download/latest/wuzz_linux_amd64
  chmod +x wuzz_linux_amd64
  sudo mv wuzz_linux_amd64 /usr/local/bin/wuzz
}

update_zsh_autosuggestion() {
  rm -rf ~/.zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
  rm -rf ~/.zsh/zsh-autosuggestions/.git \
    ~/.zsh/zsh-autosuggestions/spec \
    ~/.zsh/zsh-autosuggestions/.git
}

CLEAN_DOTFILES

INSTALL_DOTFILES

PACMAN_INIT

INSTALL_FROM_FILE yay-recommended
INSTALL_EACH_FROM_FILE yay

# NEW_USER _$USER

ENABLE_DHCP_ETHERNET(){
  sudo systemctl start NetworkManager.service
  sudo systemctl start dhcpcd.service
}
