clear

[[ $- != *i* ]] && return

. $HOME/.shell_common

# --------------------------------------------------
# ZSH
#--------------------------------------------------


# SSH key check
test -f ~/.ssh/id_rsa
[ "$?" = 0 ] && SSHRSA_OK=yes
[ -z $SSHRSA_OK ] && >&2 echo "[WARNING] No id_rsa SSH private key found, SSH functionalities might not work"

# Timezone check
[ -z $TZ ] && >&2 echo "[WARNING] TZ environment variable not set, time might be wrong!"

# Docker check
test -S /var/run/docker.sock
[ "$?" = 0 ] && DOCKERSOCK_OK=yes
[ -z $DOCKERSOCK_OK ] && >&2 echo "[WARNING] Docker socket not found, docker will not be available"


HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd *"
HISTCONTROL="ignoreboth:erasedups"
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT='%s'
TERM=xterm-256color

# bindkey "\e[7~" beginning-of-line
# bindkey "\e[8~" end-of-line
# bindkey "^[[1;5C" forward-word
# bindkey "^[[1;5D" backward-word
# bindkey "^[[3~" delete-char
# bindkey "^[3;5~" delete-char

[ -s "$HOME/.zprezto/init.zsh" ] && \. "$HOME/.zprezto/init.zsh"
if [[ "$(is_installed starship)" != "0" ]]; then
  eval "$(starship init zsh)"
fi

# dircolors
if [ -x "$(command -v dircolors)" ]; then
  eval "$(dircolors -b $HOME/.dircolors)"
  # alias ls='ls --color=auto'
fi

#disable beep sound in terminal application (x11 sessions)
#xset -b

# clear
alias keyrepeaton="defaults write -g ApplePressAndHoldEnabled -bool false && defaults write NSGlobalDomain InitialKeyRepeat -int 20 && defaults write NSGlobalDomain KeyRepeat -int 1"
alias keyrepeatoff="defaults write -g ApplePressAndHoldEnabled -bool true && defaults delete NSGlobalDomain KeyRepeat && defaults delete NSGlobalDomain InitialKeyRepeats"

if [[ "$(is_installed node)" == "0" ]]; then
  eval "$(fnm env --multi)"
fi

# GPG DAEMON
# Add the following to your shell init to set up gpg-agent automatically for every shell
# if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
#   source ~/.gnupg/.gpg-agent-info
#   export GPG_AGENT_INFO
# else
  # eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
# fi

# SSH AGENT
keychain --nogui $HOME/.ssh/id_rsa
source $HOME/.keychain/rsurj-desk-sh

# FNM
eval "$(fnm env)"

# STARSHIP PROMPT
eval "$(starship init zsh)"
