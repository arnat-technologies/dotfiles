echo '>>> Configuring Arch LINUX'
cat archlinuxfr >> /etc/pacman.conf

echo '>>> Refresing Pacman GPG Keys'
gpgconf --kill all
pacman-key --init
pacman-key --populate
pacman-key --refresh-keys
pacman -Sy archlinux-keyring --noconfirm

echo '>>> Updating all packages to the latest versions'
pacman -Syyu --noconfirm

echo ">> Installing Core Libraries fakeroot base-devel binutils"
pacman -R fakeroot-tcp --noconfirm
pacman -S base-devel --noconfirm
pacman -S binutils --noconfirm

echo '>>> Installing ZSH'
pacman -S zsh --noconfirm

echo ">> Installing GIT"
pacman -S git --noconfirm

echo ">>> Creating a user rsurj"
groupadd sudo
cat sudoers >> /etc/sudoers
useradd -m -G wheel,sudo -s /bin/zsh rsurj
echo rsurj:rsurj | chpasswd
touch /home/rsurj/.zshrc
