---
to: .devcontainer/preinstall.sh
---
echo ">>> RUNNING preinstall.sh"

echo ">>> Removing folders/files of user $(whoami)"
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

