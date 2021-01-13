---
to: .devcontainer/start.sh
---
echo ">>> RUNNING start.sh"

echo ">>> Setting dotfiles"
zsh -c '
  source /home/$(whoami)/.user/dotfiles/.scripts/00-ENVIRONMENT.sh
'

# 
# 
# BELOW GOES YOUR CUSTOM SCRIPTS
# 
# 
