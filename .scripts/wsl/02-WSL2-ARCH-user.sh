
echo '>>> Installing yay'
git clone https://aur.archlinux.org/yay.git
chown -R  rsurj:rsurj yay
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

echo '>>> Installing Packages from file packages'
sudo cat /root/packages | while read pkg
do
  echo ">> Installing $pkg"
  yay -S $pkg --noconfirm
done
