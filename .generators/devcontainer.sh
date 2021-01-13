#!/bin/zsh

export GENERATOR_FOLDER=$DOTFILES/.generators

if [[ "$(is_installed npm)" == "0" ]]; then
  echo ">>> npm is required!"
  return 0;
fi

if [[ "$(is_installed hygen)" == "0" ]]; then
  npm i -g hygen
fi


. $GENERATOR_FOLDER/devcontainer.env

echo ">>> Generating DevContainer through hygen"
HYGEN_OVERWRITE=1 HYGEN_TMPLS=$GENERATOR_FOLDER hygen devcontainer new \
  --dockerFile $DEVCONTAINER_DOCKERFILE \
  --shell $DEVCONTAINER_SHELL \
  --repository $DEVCONTAINER_DOTFILES \
  --ramFolder $DEVCONTAINER_RAM_FOLDER \
  --targetPath $DEVCONTAINER_TARGET

echo " 
HYGEN ENVIRONMENT VARIABLES:

DEVCONTAINER_DOCKERFILE -> $DEVCONTAINER_DOCKERFILE
DEVCONTAINER_SHELL -> $DEVCONTAINER_SHELL
DEVCONTAINER_DOTFILES -> $DEVCONTAINER_DOTFILES
DEVCONTAINER_RAM_FOLDER -> $DEVCONTAINER_RAM_FOLDER
DEVCONTAINER_TARGET -> $DEVCONTAINER_TARGET
"

unset DEVCONTAINER_RAM_FOLDER DEVCONTAINER_DOTFILES DEVCONTAINER_TARGET DEVCONTAINER_SHELL DEVCONTAINER_DOCKERFILE

# echo ">>> Creating folder"
# mkdir .devcontainer

# echo ">>> Setting variables"
# # . $DEVCONTAINER/environment

# echo ">> Generating devcontainer.json"
# cat $DEVCONTAINER/devcontainer.json | gomplate -d env=$DEVCONTAINER/environment.json
