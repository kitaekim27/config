#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

# Install vim-plug, a vim plugin manager.
# Check [https://github.com/junegunn/vim-plug] for detailed description.
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp -rv $(dirname $0)/nvim ~/.config
nvim --headless -c "PlugInstall" -c "qa"

cat << EOF >> ~/.config/nvim/init.lua
require('init-config')
require('init-nvim-lspconfig')
EOF

cat << EOF >> ~/.zshrc
EDITOR="nvim"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"
EOF
