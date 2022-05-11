#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

sudo apt-get update && sudo apt-get upgrade -y

# NOTE: Ubuntu is shipped with ibus-hangul but Kubuntu does not.
# NOTE: Hope that nodejs is latest enough.
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
  nodejs \
  ibus-hangul \
  zsh \
  fzf \
  silversearcher-ag \
  fd-find

readonly RECIPES="zsh tmux fzf ag fd tree"

for recipe in $RECIPES; do
  recipes/$recipe/configure.sh
done
