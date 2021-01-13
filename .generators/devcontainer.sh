#!/bin/zsh

echo '
______ _____ _   _ _____ _____ _   _ _____ ___  _____ _   _  ___________ 
|  _  \  ___| | | /  __ \  _  | \ | |_   _/ _ \|_   _| \ | ||  ___| ___ \
| | | | |__ | | | | /  \/ | | |  \| | | |/ /_\ \ | | |  \| || |__ | |_/ /
| | | |  __|| | | | |   | | | | . ` | | ||  _  | | | | . ` ||  __||    / 
| |/ /| |___\ \_/ / \__/\ \_/ / |\  | | || | | |_| |_| |\  || |___| |\ \ 
|___/ \____/ \___/ \____/\___/\_| \_/ \_/\_| |_/\___/\_| \_/\____/\_| \_|
                                                                         
                                                                         
 _____  _____ _   _  ___________  ___ _____ ___________                  
|  __ \|  ___| \ | ||  ___| ___ \/ _ \_   _|  _  | ___ \                 
| |  \/| |__ |  \| || |__ | |_/ / /_\ \| | | | | | |_/ /                 
| | __ |  __|| . ` ||  __||    /|  _  || | | | | |    /                  
| |_\ \| |___| |\  || |___| |\ \| | | || | \ \_/ / |\ \                  
 \____/\____/\_| \_/\____/\_| \_\_| |_/\_/  \___/\_| \_|                 
                                                                         
                                                                         
'

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
  --extensions $DEVCONTAINER_EXTENSIONS \
  --targetPath $DEVCONTAINER_TARGET

echo " 
HYGEN ENVIRONMENT VARIABLES:

DEVCONTAINER_DOCKERFILE -> $DEVCONTAINER_DOCKERFILE
DEVCONTAINER_SHELL -> $DEVCONTAINER_SHELL
DEVCONTAINER_DOTFILES -> $DEVCONTAINER_DOTFILES
DEVCONTAINER_RAM_FOLDER -> $DEVCONTAINER_RAM_FOLDER
DEVCONTAINER_TARGET -> $DEVCONTAINER_TARGET
DEVCONTAINER_EXTENSIONS -> $DEVCONTAINER_EXTENSIONS
"

unset DEVCONTAINER_RAM_FOLDER DEVCONTAINER_DOTFILES DEVCONTAINER_TARGET DEVCONTAINER_SHELL DEVCONTAINER_DOCKERFILE
