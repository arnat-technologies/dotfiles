# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi

# # Setting PATH for Python 3.12
# # The original version is saved in .zprofile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
# export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
