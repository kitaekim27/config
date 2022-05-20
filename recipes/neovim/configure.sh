#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

# Install vim-plug, a vim plugin manager.
# Check [https://github.com/junegunn/vim-plug] for detailed description.
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

install -D $(dirname $0)/lua ~/.config/nvim
install -D $(dirname $0)/indent ~/.config/nvim/after

install -D $(dirname $0)/init.lua ~/.config/nvim/init.lua
nvim --headless -c ":PlugInstall" -c ":qa"

cat << EOF >> ~/.zshrc
EDITOR="nvim"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

EOF

