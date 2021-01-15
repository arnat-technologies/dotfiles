---
to: .devcontainer/Dockerfile
---
FROM arnat/devcontainer:arch
# FROM arnat/devcontainer:alpine-node-15
# FROM arnat/devcontainer:alpine
# FROM arnat/devcontainer:debian

ARG NODE_VERSION=<%= nodeVersion %>
ARG YARN_VERSION=<%= yarnVersion %>
ARG NPM_VERSION=<%= npmVersion %>

# 
# 
# BELOW GOES YOUR CUSTOM BUILD
# 
# 

## NODE & NPM & YARN
# RUN source ~/.zshrc && \
#     fnm install v$NODE_VERSION && \
#     npm install --global npm@$NPM_VERSION && \
#     npm install --global yarn@$YARN_VERSION

