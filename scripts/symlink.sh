export TARGET_HOME=$HOME
export DOTFILES_DIR="$TARGET_HOME/.user/dotfiles/files"

. $TARGET_HOME/.user/dotfiles/scripts/print.sh

cd $DOTFILES_DIR

FOLDERS_FINDER=$(find $DOTFILES_DIR -type d) 
FOLDERS_TO_MAKE=$(echo $FOLDERS_FINDER | sed -e "s@$DOTFILES_DIR@$TARGET_HOME@g")
FILES_FINDER=$(find $DOTFILES_DIR -type f) 
FILES_TO_SYMLINK=$(echo $FILES_FINDER | sed -e "s@$DOTFILES_DIR@@g")

for folder_to_create in $FOLDERS_TO_MAKE; do
 if [ -d "$folder_to_create" ]; then
   :
 else
    mkdir -p $folder_to_create
 fi
done

for filename in $FILES_TO_SYMLINK; do
 sourceFile="$DOTFILES_DIR$filename" 
 targetFile="$TARGET_HOME$filename"

  if [ ! -e "$targetFile" ]; then
    ln -fs $sourceFile $targetFile
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

for binary_file in $TARGET_HOME/bin/*; do
  echo "chmod +rwx $TARGET_HOME/bin/${binary_file##*/}"
  chmod +rwx $TARGET_HOME/bin/${binary_file##*/}
done

psuccess "#setting @arch +install @done"

# ask_for_confirmation "symlink only?"
# if answer_is_yes; then
#   . $DOTFILES/scripts/symlink.sh
#   exit 1
# fi
