#!/bin/zsh

ask_for_confirmation "enable as service?"
if answer_is_yes; then
  sudo cp $DOTFILES/installation/files/urxvtd.service /etc/systemd/system/urxvtd@.service

  sudo systemctl enable urxvtd@$USER.service
  sudo systemctl start urxvtd@$USER.service
fi
