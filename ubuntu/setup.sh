#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
  python3 \
  build-essential \
  bear \
  clangd \
  gdb \
  git \
  curl \
  wget \
  net-tools \
  silversearcher-ag \
  fd-find \
  tmux \
  neovim \
  fzf

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt-get install -y fcitx-hangul
im-config -n fcitx # Set fcitx as a default input method.
