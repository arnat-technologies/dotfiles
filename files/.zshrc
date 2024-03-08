[[ $- != *i* ]] && return

export HOMEUSER="$HOME/.user"
export DOTFILES="$HOMEUSER/dotfiles"
export SHELL=/usr/bin/zsh
export EDITOR='nvim'
export PATH=$PATH:$HOME/bin

. $DOTFILES/shell/core
. $DOTFILES/shell/base

if [ -f "$HOME/.user/work" ]; then . $HOME/.user/work; fi

# # fnm
# export PATH="/Users/t34848/Library/Application Support/fnm:$PATH"
# eval "$(fnm env)"

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
