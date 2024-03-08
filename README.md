# Dotfiles for Arnat Organization

## Remote installation

```shell
source <(curl -s https://raw.githubusercontent.com/arnat-technologies/dotfiles/prd/remote-install.sh?$(date +%s))
```

## Features

- Symlink only files from `/files` folder

- [ ] Improve README.md

## How to run locally?

This following script set DOTFILES variable and enable core aliases. Available OS are:

- arch
- ubuntu
- osx
- wsl2

Then run pre-installation or post-installation interactively

```shell
# Sample configuration for locally settings
SELECTION=osx
DOTFILES=$(pwd)
. $DOTFILES/shell/core

ask_for_confirmation "preinstallation?"
if answer_is_yes; then
  SELECTION="pre.$SELECTION"
else
  SELECTION="post.$SELECTION"
fi

. $DOTFILES/installation/$SELECTION
```

## How to Symlink Files?

```shell
DOTFILES=$(pwd)
. $DOTFILES/shell/core
symlink-dotfiles
```

## How to Install a package

Script verify the best package manager accoding your OS, also includes run of CONFIGURE_PACKAGE

```shell
SELECTION=osx
SOFTWARE=vscode

DOTFILES=$(pwd)
. $DOTFILES/shell/core
. $DOTFILES/installation/base.linux
INSTALL_PACKAGE $SOFTWARE.$SELECTION
```

## Configure a specific Software

Should update SELECTION by your current OS

```shell
SELECTION=osx
SOFTWARE=vscode

DOTFILES=$(pwd)
. $DOTFILES/shell/core
. $DOTFILES/installation/base.linux
CONFIGURE_PACKAGE $SOFTWARE.$SELECTION
```
