#!/bin/zsh
print_info ">>> SYMLINKING DOTFILES"

if [ -z "$SILENT_INSTALL" ]
then
    while true; do
    read -p "Warning: this will overwrite your current dotfiles. Continue? [y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
    done
else
    print_info ">>> STARTING SYMLINKING SILENTLY"
fi
print_info ">>> SYMLINKING FILES..."

ignored_files=(
  .
  ..
  .git
  .vscode
  .vscode.rsurj
  .vim
  .scripts
  .build
  bootstrap.sh
  config
  files
  LICENCE
  README.md
  remote-setup.sh
  startup.desktop
)
local i=''
local sourceFile=''
local targetFile=''
cd $DOTFILES_DIR

for filename in .* *; do
  if [[ " ${ignored_files[*]} " == *" $filename "* ]]; then
    print_info "no symlink for → $filename";
  else
    sourceFile="$DOTFILES_DIR/$filename"
    targetFile="$TARGET_HOME/$filename"
    if [ ! -e "$targetFile" ]; then
      ln -fs $sourceFile $TARGET_HOME
      print_success "$targetFile → $sourceFile"
    else

      if [ -z "$SILENT_INSTALL" ]
      then
            echo "SILENT INSTALL DISABLES"
            ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
            if answer_is_yes; then
              rm -rf "$targetFile"
              ln -fs $sourceFile $targetFile
              print_success "$targetFile → $sourceFile"
            else
              print_error "$targetFile → $sourceFile"
            fi
      else
            print_info ">>> OVERWRITTING SILENTLY $targetFile"
            rm -rf "$targetFile"
            ln -fs $sourceFile $targetFile
            print_success "$targetFile → $sourceFile"
      fi

    fi
  fi
done
for i in $TARGET_HOME/bin/*; do
  echo "Changing access permissions for binary script :: ${i##*/}"
  chmod +rwx $TARGET_HOME/bin/${i##*/}
done

print_success ">>> SYMLINK COMPLETED"
