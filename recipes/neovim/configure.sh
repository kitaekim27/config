#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

# Install vim-plug, a vim plugin manager.
# Check [https://github.com/junegunn/vim-plug] for detailed description.
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

install -D $(dirname $0)/init.vim "${HOME}/.config/nvim/init.vim"
nvim --headless -c ":PlugInstall" -c ":qa"

install -D $(dirname $0)/coc_config.vim "${HOME}/.local/share/nvim/site/plugin/coc_config.vim"
nvim --headless -c ":CocInstall coc-clangd coc-python coc-rls coc-sh" -c ":qa"

echo '
EDITOR="nvim"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"
' >> ~/.zshrc
