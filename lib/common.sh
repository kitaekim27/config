#!/bin/bash

subcmd() {
  ${@} | nl -b n
}

log() {
  local message="${1}"
  echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] ${message}"
}

error() {
  local message="${1}"
  echo -e "[$(date +'%Y-%m-%d %H:%M:%S')] \e[1m\e[31mERROR:\e[0m ${message}" >&2
  exit 1
}

success_installation() {
  local message="${1}"
  echo -e "\e[1;32mInstallation success!\e[0m"
  echo -e "Post installation instructions:"
  echo -e "${message}"
}

