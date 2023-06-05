#!/bin/bash

install_from_file() {
  local PACKAGES=${1:-}
  cat $DOTFILES/packages/$PACKAGES | while read pkg; do
    install_package $pkg
  done
}

install_package() {
  local PACKAGES=${1:-}
  if [ -x "$(command -v apk)" ]; then
    apk add --no-cache $PACKAGES
  elif [ -x "$(command -v apt-get)" ]; then
    sudo apt-get install $PACKAGES -y
  elif [ -x "$(command -v dnf)" ]; then
    dnf install $PACKAGES
  elif [ -x "$(command -v zypper)" ]; then
    zypper install $PACKAGES
  elif [ -x "$(command -v yay)" ]; then
    yay -S --noconfirm $PACKAGES
  elif [ -x "$(command -v pacman)" ]; then
    sudo pacman -S --noconfirm $PACKAGES
  else echo ":: [Software]    |  Install manually: $PACKAGES" >&2; fi
}

new_user_folder() {
  [[ ! -d "$HOME/.user" ]] && mkdir -p "$HOME/.user"
  cd $HOME/.user
  rm -rf $HOME/.user/dotfiles
}

install_dotfiles() {
  install_package git
  git clone https://github.com/arnat-technologies/dotfiles.git $HOME/.user/dotfiles
  export DOTFILES=$HOME/.user/dotfiles
}

install_cheat() {
  cd /tmp
  curl -OL https://github.com/cheat/cheat/releases/download/4.2.5/cheat-linux-amd64.gz
  gunzip cheat-linux-amd64.gz
  chmod +x cheat-linux-amd64
  sudo mv cheat-linux-amd64 /usr/local/bin/cheat
}

new_user() {
  local USER=${1:-}
  groupadd sudo
  echo "$USER ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
  useradd -m -G wheel,sudo -s /bin/zsh $USER
  echo $USER:$USER | chpasswd
  touch /home/$USER/.zshrc
  psuccess ":: [Setting]    |  New user $USER"
}

# install_navi() {
#   bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)
# }

install_fzf() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

# go_linux

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

ssh_manual_copy_id() {
  cat ~/.ssh/id_rsa.pub | ssh $1@$2 "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

init_id_rsa() {
  ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
}

init_ssh_config() {
  sudo tee -a /etc/ssh/sshd_config <<END
Port 22
ListenAddress 0.0.0.0
# PasswordAuthentication yes
END
}

install_tmux() {
  git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
  rm -rf ~/.tmux/plugins/tmux-resurrect/.git
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  rm -rf ~/.tmux/plugins/tpm/.git
  ~/.tmux/plugins/tpm/bin/install_plugins
  ~/.tmux/plugins/tpm/bin/update_plugins all
}

finish_ssh_config() {
  #
}
