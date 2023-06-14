[[ $- != *i* ]] && return

export HOMEUSER="$HOME/.user"
export PROJECTS="$HOMEUSER/projects"
export CONCEPTS="$HOMEUSER/concepts"
export DOTFILES="$HOMEUSER/dotfiles"
export I3BLOCKS=$HOME/i3blocks-contrib
export SHELL=/usr/bin/zsh
export EDITOR='nvim'

export PATH=$PATH:$HOME/bin
# export NAVI_CONFIG_YAML=$HOME/.navi

# # ZSH COMPLETION
# autoload -U compinit
# compinit

. $DOTFILES/shell/core
. $DOTFILES/shell/base

if [ -f "$HOME/.user/work" ]; then
  . $HOME/.user/work
fi

# if [ -x "$(command -v dircolors)" ]; then eval "$(dircolors -b $HOME/.dircolors)"; fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# eval "$(ssh-agent -s)"
# if [ -n "${SSH_AGENT_PID}" ]; then
#   eval "$(ssh-agent -k)"
# fi

# keychain --nogui --quiet $HOME/.ssh/id_rsa

eval "$(starship init zsh)"
eval "$(fnm env)"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# function _navi_() {
#   zle kill-whole-line
#   zle -U "$("navi")"
#   zle accept-line
# }

# zle -N _navi_
# bindkey '\eg' _navi_

# 2. export compiler related env variables
export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"
export PATH="$PATH":"$HOME/.pub-cache/bin"
