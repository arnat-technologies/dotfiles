

# Arch Linux
ln -fs $DOTFILES_DIR/.vscode/settings.json $HOME/.config/Code/User/settings.json
rm -rf $HOME/.config/Code/User/snippets # because it will symlink
ln -fs $DOTFILES_DIR/.vscode/snippets $HOME/.config/Code/User

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
# sudo systemctl enable urxvtd@rsurj.service
# sudo systemctl start urxvtd@rsurj.service

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
# sudo systemctl enable tmux@rsurj.service
# sudo systemctl start tmux@rsurj.service


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
