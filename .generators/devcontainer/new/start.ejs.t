---
to: .devcontainer/start.sh
---
#!/bin/zsh

echo ">>> RUNNING start.sh"

echo ">>> Sourcing ~/.zshrc"
source ~/.zshrc

echo ">>> Setting Dotfiles"
TMP=$(pwd) && source /home/$(whoami)/.user/dotfiles/.scripts/00-ENVIRONMENT.sh && cd $TMP

#
#
# BELOW GOES YOUR CUSTOM SCRIPTS
#
#

# fnm use v<%= nodeVersion %>
