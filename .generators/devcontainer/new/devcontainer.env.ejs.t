---
to: .devcontainer/devcontainer.env
---
FOLDERS_TO_SYNC="<% ramFolder.split(' ').forEach(function(folder){ %><%= folder %> <% });%>"
