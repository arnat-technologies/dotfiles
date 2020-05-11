if [ -z "$VSCODE_CONTAINER" ]
then
    echo ">>> NOT IS A VSCODE CONTANER ENVIRONMENT"
else
    echo ">>> VSCODE ENVIRONMENT DETECTED"
    cd "$(pwd)/00-INSTALLER/02-SCRIPTS"
fi

export SILENT_INSTALL=true
if [ -n "$ZSH_VERSION" ]; then
  echo ">>> RUNNING ZSH :)"
  source "./01-INSTALLER--ALPINE.sh"
else
  zsh "./01-INSTALLER--ALPINE.sh"
fi


print_success ">>> BOOTSTRAPING FINALIZED..."
