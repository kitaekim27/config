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
  neovim \
  ibus-hangul \
  zsh \
  fzf \
  silversearcher-ag \
  fd-find

readonly RECIPES="zsh fzf neovim ag fd tree"

for recipe in $RECIPES; do
  recipes/$recipe/configure.sh
done

