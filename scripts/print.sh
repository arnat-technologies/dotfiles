#!/bin/zsh

perror() { printf "\n\e[0;31m  [✖] $1 $2\e[0m\n\n"; }
pinfo() { printf "\n\e[0;35m  [ℹ] $1\e[0m\n\n"; }
pquestion() { printf "\n\e[0;33m  [?] $1\e[0m\n\n"; }
psuccess() { printf "\n\e[0;32m  [✔] $1\e[0m\n\n"; }
presult() {
  [ $1 -eq 0 ] \
    && psuccess "$2" \
    || perror "$2"
  [ "$3" == "true" ] && [ $1 -ne 0 ] \
    && exit
}

answer_is_yes(){
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

ask_for_confirmation(){
  pquestion "$1 (y/n) "
  read -n 1
  printf "\n"
}

execute(){
  $1 &> /dev/null
  presult $? "${2:-$1}"
}

get_input(){
  pquestion $1
  vared -p '=> : ' -c tmp_input
}
