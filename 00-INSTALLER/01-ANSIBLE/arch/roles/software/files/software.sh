print_info "Installing Trizen AUR manager https://github.com/trizen/trizen";

git clone https://aur.archlinux.org/trizen.git /tmp/trizen
cd /tmp/trizen
makepkg -si
