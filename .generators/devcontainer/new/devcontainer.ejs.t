---
to: .devcontainer/devcontainer.json
---
{
  "name": "${localWorkspaceFolderBasename}",
  "dockerComposeFile": [<% dockerComposeFile.split(' ').forEach(function(extension, idx){ %>
    "<%= extension %>"<% if (idx +1 !== dockerComposeFile.split(' ').length) { %> , <% } else {  %><% }  %>
    <% }); %>
  ],
  "service": "app",
  "workspaceFolder": "<%= workspace %>",
  "appPort": [],
  "runArgs": [
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
  "postStartCommand": "/bin/zsh .devcontainer/start.sh",
  "initializeCommand": "/bin/zsh .devcontainer/initialize.sh",
  "postAttachCommand": "/bin/zsh .devcontainer/attach.sh",
  "postCreateCommand": "/bin/zsh .devcontainer/create.sh",
  "extensions": [<% extensions.split(' ').forEach(function(extension, idx){ %>
    "<%= extension %>"<% if (idx +1 !== extensions.split(' ').length) { %> , <% } else {  %><% }  %>
    <% }); %>
  ]
}
