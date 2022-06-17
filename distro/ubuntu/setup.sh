#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y \
  build-essential \
  clangd \
  gdb \
  bear \
  tree \
  git \
  curl \
  wget \
  tmux \
  neovim \
  ibus-hangul \
  zsh \
  fzf \
  silversearcher-ag \
  fd-find

# Note that there's order dependency between scripts.
readonly RECIPES="zsh tmux fzf neovim ag fd tree"

for recipe in "$RECIPES"; do
  "recipes/$recipe/configure.sh"
done
