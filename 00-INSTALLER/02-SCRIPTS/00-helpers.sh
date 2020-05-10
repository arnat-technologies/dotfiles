#!/bin/bash

# HELPERS

answer_is_yes(){
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}
ask_for_confirmation(){
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}
execute(){
  $1 &> /dev/null
  print_result $? "${2:-$1}"
}
print_error() { printf "\e[0;31m  [✖] $1 $2\e[0m\n"; }
print_info() { printf "\n\e[0;35m $1\e[0m\n\n"; }
print_question() { printf "\e[0;33m  [?] $1\e[0m"; }
print_success() { printf "\e[0;32m  [✔] $1\e[0m\n"; }
print_result() {
  [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"
  [ "$3" == "true" ] && [ $1 -ne 0 ] \
    && exit
}

print_success ">>> REGISTERED HELPERS"
