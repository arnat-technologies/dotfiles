if [ -z "$VSCODE_CONTAINER" ]
then
    print_info ">>> NOT IS A VSCODE CONTANER ENVIRONMENT"
else
    print_info ">>> VSCODE ENVIRONMENT DETECTED"
    cd "$(pwd)/00-INSTALLER/02-SCRIPTS"
fi

export SILENT_INSTALL=true
source "./01-INSTALLER--ALPINE.sh"

print_success ">>> BOOTSTRAPING FINALIZED..."
