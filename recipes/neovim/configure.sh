#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

# Install vim-plug, a vim plugin manager.
# Check [https://github.com/junegunn/vim-plug] for detailed description.
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

install -D "${SCRIPT_ROOT_DIR}/neovim/init.vim" "${HOME}/.config/nvim/init.vim"
nvim --headless -c ":PlugInstall" -c ":qa"

install -D "${SCRIPT_ROOT_DIR}/neovim/plugin/coc_config.vim" \
  "${HOME}/.local/share/nvim/site/plugin/coc_config.vim"
nvim --headless -c ":CocInstall coc-clangd coc-python coc-rls coc-sh" -c ":qa"
