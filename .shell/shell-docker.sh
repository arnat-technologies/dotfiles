#! /bin/zsh

#                         d8888b.  .d88b.   .o88b. db   dD d88888b d8888b.
#                         88  `8D .8P  Y8. d8P  Y8 88 ,8P' 88'     88  `8D
#                         88   88 88    88 8P      88,8P   88ooooo 88oobY'
#                         88   88 88    88 8b      88`8b   88~~~~~ 88`8b
#                         88  .8D `8b  d8' Y8b  d8 88 `88. 88.     88 `88.
#                         Y8888D'  `Y88P'   `Y88P' YP   YD Y88888P 88   YD

#       _ _
#      | (_)
#  __ _| |_  __ _ ___  ___  ___
# / _` | | |/ _` / __|/ _ \/ __|
#| (_| | | | (_| \__ \  __/\__ \
# \__,_|_|_|\__,_|___/\___||___/

alias dknexus='mkdir $DATA/nexus-data 2>/dev/null; docker run --rm -it -p 8081:8081 -v $DATA/nexus-data:/nexus-data sonatype/nexus3:latest'

#  __                  _   _
# / _|                | | (_)
#| |_ _   _ _ __   ___| |_ _  ___  _ __  ___
#|  _| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
#| | | |_| | | | | (__| |_| | (_) | | | \__ \
#|_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/

dkb() {
  docker exec -it $(docker ps -aqf "name=$1") /bin/bash
}

dka() {
  docker exec -it $(docker ps -aqf "name=$1") /bin/ash
}

dki() {
  for container in "$@"; do
    docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" "${container}"
  done
}

dks() {
  if [ $# -eq 0 ]; then
    docker stop $(docker ps -aq --no-trunc)
  else
    for container in "$@"; do
      docker stop $(docker ps -aq --no-trunc | grep ${container})
    done
  fi
}

dkrmc() {
  if [ $# -eq 0 ]; then
    docker rm $(docker ps -aq --no-trunc)
  else
    for container in "$@"; do
      docker rm $(docker ps -aq --no-trunc | grep ${container})
    done
  fi
}

dkrmi() {
  if [ $# -eq 0 ]; then
    docker rmi $(docker images --filter 'dangling=true' -aq --no-trunc)
  else
    for container in "$@"; do
      docker rmi $(docker images --filter 'dangling=true' -aq --no-trunc | grep ${container})
    done
  fi
}

dkp() {
  docker tag $1 $1
  docker push $1
}
