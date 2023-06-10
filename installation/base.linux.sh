#!/bin/zsh

ssh_manual_copy_id() {
  cat ~/.ssh/id_rsa.pub | ssh $1@$2 "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
}

SSHD_CONFIG() {
  sudo tee -a /etc/ssh/sshd_config <<END
Port 22
ListenAddress 0.0.0.0
# PasswordAuthentication yes
END
}

INSTALL_EACH_FROM_FILE(){
  local PACKAGES=${1:-}

  cat $DOTFILES/packages/$PACKAGES | while read pkg; do

    ask_for_confirmation "Install $pkg?"
    if answer_is_yes; then
      INSTALL_PACKAGE $pkg
    else
      pinfo "#software @$pkg +install @fail";
    fi

  done
}

INSTALL_FROM_FILE() {
  local PACKAGES=${1:-}
  cat $DOTFILES/packages/$PACKAGES | while read pkg; do
    INSTALL_PACKAGE $pkg
  done
}

INSTALL_ADDITIONAL_PACKAGE(){
  ADDITIONAL_SOFTWARE_PACKAGE=$DOTFILES/installation/software/$1
  if [ -f "$ADDITIONAL_SOFTWARE_PACKAGE" ]; then
    . $ADDITIONAL_SOFTWARE_PACKAGE
  fi
}

INSTALL_PACKAGE() {
  pinfo "#software @$pkg +install"
  local PACKAGES=${1:-}
  if [ -x "$(command -v apk)" ]; then
    apk add --no-cache $PACKAGES
    INSTALL_ADDITIONAL_PACKAGE $PACKAGES.alpine
    pinfo "#software @$pkg +install @done"
  elif [ -x "$(command -v apt-get)" ]; then
    sudo apt-get install $PACKAGES -y
    INSTALL_ADDITIONAL_PACKAGE $PACKAGES.ubuntu
    pinfo "#software @$pkg +install @done"
  elif [ -x "$(command -v dnf)" ]; then
    dnf install $PACKAGES
    INSTALL_ADDITIONAL_PACKAGE $PACKAGES.fedora
    pinfo "#software @$pkg +install @done"
  elif [ -x "$(command -v yay)" ]; then
    yay -S --noconfirm $PACKAGES
    INSTALL_ADDITIONAL_PACKAGE $PACKAGES.arch
    pinfo "#software @$pkg +install @done"
  elif [ -x "$(command -v pacman)" ]; then
    sudo pacman -S --noconfirm $PACKAGES
    INSTALL_ADDITIONAL_PACKAGE $PACKAGES.arch
    pinfo "#software @$pkg +install @done"
  else pinfo "#software @$pkg +install @fail"; fi
}

NEW_USER() {
  local USER=${1:-}
  pinfo "#setting @user $USER +new"
  groupadd sudo
  echo "$USER ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
  useradd -m -G wheel,sudo -s /bin/zsh $USER
  echo $USER:$USER | chpasswd
  pinfo "#setting @user $USER +new @done"
}

DELETE_USER(){
  sudo killall -u $1
  userdel -f $1
}

INIT_ID_RSA() {
  ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
}