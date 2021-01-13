---
to: .devcontainer/devcontainer.json
---
{
  "name": "${containerWorkspaceFolderBasename} Container",
  "dockerFile": "<%= dockerFile %>",
  "appPort": [],
  "runArgs": [<% ramFolder.split(' ').forEach(function(folder){ %>
    "--tmpfs",
    "${containerWorkspaceFolder}/<%= folder %>:exec",<% }); %>
    "-u",
    "vscode",
    "--env-file",
    ".devcontainer/devcontainer.env"
  ],
  "settings": {
    "terminal.integrated.shell.linux": "<%= shell %>",
    "dotfiles.repository": "<%= repository %>",
    "dotfiles.targetPath": "<%= targetPath %>"
  },
  "postStartCommand": "/bin/zsh .devcontainer/postinstall.sh",
  "initializeCommand": "/bin/zsh .devcontainer/preinstall.sh",
  "extensions": [
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode"
  ]
}
