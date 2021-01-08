NODE_VERSION=12.20.1


echo ">>> BOOTSTRAP"
. 01-WSL2-ARCH-bootstrap.sh

echo ">>> CONFIGURING new user trought script"
cat 02-WSL2-ARCH-user.sh | sudo -i -u rsurj zsh 

echo ">>> POSTINSTALL"
. 03-WSL2-ARCH-postinstall.sh
