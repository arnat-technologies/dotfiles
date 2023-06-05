osascript -e 'tell application "System Preferences" to quit'

defaults write com.apple.dock autohide -bool true

#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 14: Quick note
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 14
defaults write com.apple.dock wvous-br-modifier -int 0

killall Dock

defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

for app in "cfprefsd" \
  "Dock" \
  "Finder" \
  "SystemUIServer"; do
  killall "${app}" &>/dev/null
done

gpgkey
gpglist




# rm -rf ~/Library/Application\ Support/Code/User/snippets
# ln -fs $DOTFILES/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# ln -fs $DOTFILES/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
# ln -fs $DOTFILES/.vscode/snippets/ ~/Library/Application\ Support/Code/User

# # Arch Linux
# ln -fs $DOTFILES_DIR/.vscode/settings.json $HOME/.config/Code/User/settings.json
# rm -rf $HOME/.config/Code/User/snippets # because it will symlink
# ln -fs $DOTFILES_DIR/.vscode/snippets $HOME/.config/Code/User

#SMAN SNIPPETS MANAGER
#ln -fs $DOTFILES_DIR/snippets $HOME/.sman

# URXVTD
# sudo rm -rf /etc/systemd/urxvtd@service
# echo "[Unit]
# Description=RXVT-Unicode Daemon

# [Service]
# User=%i
# ExecStart=/usr/bin/urxvtd -q -o

# [Install]
# WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/urxvtd@.service
# sudo systemctl enable urxvtd@CHANGE_USER.service
# sudo systemctl start urxvtd@CHANGE_USER.service

# TMUX
# echo "[Unit]
# Description=Start tmux in detached session

# [Service]
# Type=forking
# User=%I
# ExecStart=/usr/bin/tmux new-session -s %u -d
# ExecStop=/usr/bin/tmux kill-session -t %u

# [Install]
# WantedBy=multi-user.target" | sudo tee -a /etc/systemd/system/tmux@.service
# sudo systemctl enable tmux@CHANGE_USER.service
# sudo systemctl start tmux@CHANGE_USER.service

# Fix for warnings drm_kms_helper, flip_done timed out (Dell with linux kernel)
# $ vim /etc/default/grub:
# > GRUB_CMDLINE_LINUX_DEFAULT="quiet splash video=SVIDEO-1:d"

# $ sudo grub-mkconfig -o /boot/grub/grub.cfg

# postinstall  boot to 0 seconds

#sudo nano /etc/default/grub
# Change GRUB_TIMEOUT from 5 to 0

#sudo grub-mkconfig -o /boot/grub/grub.cfg

# Snippet manager
#bash -c "$(curl https://raw.githubusercontent.com/tokozedg/sman/master/install.sh)"
