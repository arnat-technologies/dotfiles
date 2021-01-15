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

GENERATOR_FOLDER=$DOTFILES/.generators

if [[ "$(is_installed npm)" == "0" ]]; then
  echo ">>> npm is required!"
  return 0;
fi

if [[ "$(is_installed hygen)" == "0" ]]; then
  npm i -g hygen
fi

echo ">>> Setting ENVIRONMENT variables"
[ ! -z "$DEVCONTAINER_RAM_FOLDER" ] || DEVCONTAINER_RAM_FOLDER="node_modules" # array
[ ! -z "$DEVCONTAINER_DOTFILES" ] || DEVCONTAINER_DOTFILES="arnat-technologies/dotfiles"
[ ! -z "$DEVCONTAINER_TARGET" ] || DEVCONTAINER_TARGET="~/.user/dotfiles"
[ ! -z "$DEVCONTAINER_SHELL" ] || DEVCONTAINER_SHELL="/bin/zsh"
[ ! -z "$DEVCONTAINER_DOCKERFILE" ] || DEVCONTAINER_DOCKERFILE="Dockerfile"
[ ! -z "$DEVCONTAINER_DOCKERCOMPOSEFILE" ] || DEVCONTAINER_DOCKERCOMPOSEFILE="docker-compose.yml" # array
[ ! -z "$DEVCONTAINER_EXTENSIONS" ] || DEVCONTAINER_EXTENSIONS="dbaeumer.vscode-eslint esbenp.prettier-vscode" # array
[ ! -z "$DEVCONTAINER_WORKSPACE" ] || DEVCONTAINER_WORKSPACE="/workspace"
[ ! -z "$DEVCONTAINER_NODE_VERSION" ] || DEVCONTAINER_NODE_VERSION="12.20.1"
[ ! -z "$DEVCONTAINER_YARN_VERSION" ] || DEVCONTAINER_YARN_VERSION="1.22.10"
[ ! -z "$DEVCONTAINER_YARN_VERSION" ] || DEVCONTAINER_YARN_VERSION="1.22.10"
[ ! -z "$DEVCONTAINER_NPM_VERSION" ] || DEVCONTAINER_NPM_VERSION="6.14.11"

echo ">>> Generating DevContainer through hygen"
HYGEN_OVERWRITE=1 HYGEN_TMPLS=$GENERATOR_FOLDER hygen devcontainer new \
  --dockerFile $DEVCONTAINER_DOCKERFILE \
  --dockerComposeFile $DEVCONTAINER_DOCKERCOMPOSEFILE \
  --shell $DEVCONTAINER_SHELL \
  --repository $DEVCONTAINER_DOTFILES \
  --ramFolder $DEVCONTAINER_RAM_FOLDER \
  --nodeVersion $DEVCONTAINER_NODE_VERSION \
  --yarnVersion $DEVCONTAINER_YARN_VERSION \
  --npmVersion $DEVCONTAINER_NPM_VERSION \
  --workspace $DEVCONTAINER_WORKSPACE \
  --extensions $DEVCONTAINER_EXTENSIONS \
  --targetPath $DEVCONTAINER_TARGET

echo " 
HYGEN ENVIRONMENT VARIABLES:

DEVCONTAINER_DOCKERFILE -> $DEVCONTAINER_DOCKERFILE
DEVCONTAINER_WORKSPACE -> $DEVCONTAINER_WORKSPACE
DEVCONTAINER_SHELL -> $DEVCONTAINER_SHELL
DEVCONTAINER_DOTFILES -> $DEVCONTAINER_DOTFILES
DEVCONTAINER_TARGET -> $DEVCONTAINER_TARGET
DEVCONTAINER_NODE_VERSION -> $DEVCONTAINER_NODE_VERSION
DEVCONTAINER_YARN_VERSION -> $DEVCONTAINER_YARN_VERSION
DEVCONTAINER_NPM_VERSION -> $DEVCONTAINER_NPM_VERSION
(ARRAY) DEVCONTAINER_EXTENSIONS -> $DEVCONTAINER_EXTENSIONS
(ARRAY) DEVCONTAINER_DOCKERCOMPOSEFILE -> $DEVCONTAINER_DOCKERCOMPOSEFILE
(ARRAY) DEVCONTAINER_RAM_FOLDER -> $DEVCONTAINER_RAM_FOLDER
"

echo ">>> Removing ENVIRONMENT variables"
unset DEVCONTAINER_RAM_FOLDER DEVCONTAINER_DOTFILES DEVCONTAINER_TARGET DEVCONTAINER_SHELL DEVCONTAINER_DOCKERFILE GENERATOR_FOLDER DEVCONTAINER_WORKSPACE
