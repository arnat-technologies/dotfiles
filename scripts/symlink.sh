#!/bin/bash

export TARGET_HOME=$HOME
export DOTFILES_DIR="$TARGET_HOME/.user/dotfiles/files"

local i=''
local sourceFile=''
local targetFile=''
cd $DOTFILES_DIR

# TODO: Only symlink FILES

for filename in .* *; do
  sourceFile="$DOTFILES_DIR/$filename"
  targetFile="$TARGET_HOME/$filename"
  if [ ! -e "$targetFile" ]; then
    ln -fs $sourceFile $TARGET_HOME
    psuccess "$targetFile → $sourceFile"
  else

    ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
    if answer_is_yes; then
      rm -rf "$targetFile"
      ln -fs $sourceFile $targetFile
      psuccess "$targetFile → $sourceFile"
    else
      perror "$targetFile → $sourceFile"
    fi

  fi
done

for i in $TARGET_HOME/bin/*; do
  echo "Changing access permissions for binary script :: ${i##*/}"
  chmod +rwx $TARGET_HOME/bin/${i##*/}
done

psuccess "(symlink.sh) :: Process completed!"
