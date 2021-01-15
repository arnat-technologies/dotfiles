---
to: .devcontainer/initialize.sh
---
#!/bin/zsh

echo ">>> RUNNING initialize.sh"

echo ">>> getting ENVIRONMENT from .env"
source .devcontainer/.env

echo ">>> Removing RAM folders"
setopt shwordsplit
for fldr in $FOLDERS_TO_SYNC; do
  rm -rf $fldr
  echo ">>> removed file/folder $fldr"
done
unsetopt shwordsplit

#
#
# BELOW GOES YOUR CUSTOM SCRIPTS
#
#
