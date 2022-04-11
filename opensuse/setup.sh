#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

sudo zypper dist-upgrade

sudo zypper install -y \
  python \
  python3 \
  clang-devel \
  clang-tools \
  Bear \
  git \
  nodejs-default \
  neovim \
  tmux
