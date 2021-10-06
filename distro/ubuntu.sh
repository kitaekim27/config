#!/bin/bash
# Last update: 10.07.2021
#
# Installation script for Ubuntu.

set -o errexit -o nounset -o errtrace -o pipefail

source ${SETUP_ROOT_DIR}/lib/common.sh

setup_basic_tools() {
  sudo apt-get install -yq \
    python-is-python3 python3-pip \
    build-essential bear clangd gdb git \
    curl wget net-tools
}

setup_fcitx_hangul() {
  sudo apt-get install -yq fcitx-hangul
  im-config -n fcitx # Set the fcitx as a default input method.
}

setup_zsh() {
  sudo apt-get install -yq zsh
  sudo chsh -s /usr/bin/zsh "${USER}" # Set the zsh as a default login shell.

  # Install oh-my-zsh, a zsh configuration framework.
  # Check [https://github.com/ohmyzsh/ohmyzsh] for detailed description.
  [ -d "${HOME}/.oh-my-zsh" ] && rm -rf "${HOME}/.oh-my-zsh"
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

  # Install zsh-syntax-highlighting plugin, a plugin for fish-like syntax highlighting.
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git --depth=1 \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  # Install zsh-autosuggestions plugin, a plugin for fish-like suggestions.
  git clone https://github.com/zsh-users/zsh-autosuggestions --depth=1 \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  install "${PWD}/dotfiles/zshrc" "${HOME}/.zshrc"
}

setup_neovim() {
  # Install neovim, a modern fork of the good old vim.
  # Check [https://github.com/neovim/neovim] for detailed description.
  sudo apt-get install -yq neovim

  # Install vim-plug, a vim plugin manager.
  # Check [https://github.com/junegunn/vim-plug] for detailed description.
  curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  install -D "${PWD}/dotfiles/init.vim" "${HOME}/.config/nvim/init.vim"
  nvim --headless +PlugInstall +qa # Need to install coc.nvim before applying config for the plugin.
  cat "${PWD}/dotfiles/coc-config.vim" >> "${HOME}/.config/nvim/init.vim"
}

setup_emacs() {
  sudo apt-get install -yq emacs
  systemctl --user enable emacs # Launch emacs daemon automatically.

  # Install spacemacs, a modern emacs configuration framework.
  # Check [https://www.spacemacs.org/] for detailed description.
  [ -d "${HOME}/.emacs.d" ] && rm -rf "${HOME}/.emacs.d"
  git clone -q "https://github.com/syl20bnr/spacemacs ${HOME}/.emacs.d"
}

setup_tmux() {
  sudo apt-get install -yq tmux
  install "${PWD}/dotfiles/tmux.conf" "${HOME}/.tmux.conf"
}

setup_node() {
  # Install nodejs, a JavaScript runtime.
  curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
  sudo apt-get install -y nodejs
}

setup_gef() {
  # Install GEF, an extended GDB.
  # Check [https://github.com/hugsy/gef] for detailed description.

  # Note that you can't use zsh here.
  wget -qO- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | bash

  pip -q install capstone unicorn keystone-engine ropper
}

setup_lxd() {
  sudo apt-get install -yq lxd
  sudo usermod -aG lxd "${USER}"
  yes '' | lxd init # Initialize the LXD with default options.
  install "${PWD}/scripts/lxd/*" "${HOME}/.local/bin/"
}

main() {
  sudo apt-get update -yq
  sudo apt-get upgrade -yq

  setup_basic_tools
  setup_fcitx_hangul
  setup_zsh
  setup_node
  setup_neovim
  setup_tmux

  sudo apt-get autoclean -yq
  sudo apt-get autoremove -yq

  local instructions=""
  instructions+="[fcitx]: Set fcitx as a main input method.\n"
  instructions+="[fcitx]: Configure hangul input."

  success "${instructions}"
}

main ${@}

