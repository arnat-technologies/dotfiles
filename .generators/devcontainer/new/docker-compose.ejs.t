---
to: .devcontainer/docker-compose.yml
---
version: "3"

services:
  app:
    build:
      context: .
      dockerfile: <%= dockerFile %>
    volumes:
      - ..:<%= workspace %>
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - TZ=America/Lima
    cap_add:
      - SYS_PTRACE
    security_opt:
      - seccomp:unconfined
    entrypoint: zsh -c "while sleep 1000; do :; done"
    tmpfs:<% ramFolder.split(' ').forEach(function(ramFolder){ %>
      - <%= workspace %>/<%= ramFolder %>:exec<% }); %>

#     network_mode: service:db

#   db:
#     image: mongo:latest
#     restart: unless-stopped
#     volumes:
#       - mongodb-data:/data/db
# volumes:
#   mongodb-data:
