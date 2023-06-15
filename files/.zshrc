[[ $- != *i* ]] && return

export HOMEUSER="$HOME/.user"
export DOTFILES="$HOMEUSER/dotfiles"
export SHELL=/usr/bin/zsh
export EDITOR='nvim'
export PATH=$PATH:$HOME/bin

. $DOTFILES/shell/core
. $DOTFILES/shell/base

if [ -f "$HOME/.user/work" ]; then . $HOME/.user/work; fi
