---
to: .devcontainer/postinstall.sh
---
echo ">>> RUNNING postinstall.sh"

echo ">>> Adding permissions for RAM folders of user $(whoami)"
setopt shwordsplit
for fldr in $FOLDERS_TO_SYNC; do
  chown $(whoami) $fldr
  echo ">>> assigned permissions for $fldr"
done
unsetopt shwordsplit

echo ">>> Setting dotfiles"
zsh -c '
  source /home/$(whoami)/.user/dotfiles/.scripts/00-ENVIRONMENT.sh
'

# 
# 
# BELOW GOES YOUR CUSTOM SCRIPTS
# 
# 
yarn install
