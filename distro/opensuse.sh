#!/bin/bash
# Last update: 09.12.2021
#
# Installation script for OpenSUSE.

set -o errexit -o nounset -o errtrace -o pipefail

source "${SCRIPT_ROOT_DIR}"/lib/common.sh

install_basic_tools() {
  sudo zypper install -y \
    python python3 \
    clang-devel clang-tools Bear git \
    nodejs-default
}

install_zsh() {
  sudo zypper install -y zsh
  chsh -s "$(which zsh)" "${USER}" # Set the zsh as a default login shell.

  # Install oh-my-zsh, a zsh configuration framework.
  # Check [https://github.com/ohmyzsh/ohmyzsh] for detailed description.
  [ -d "${HOME}/.oh-my-zsh" ] && rm -rf "${HOME}/.oh-my-zsh"
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

  # Install zsh-syntax-highlighting plugin, a plugin for fish-like syntax highlighting.
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git --depth=1 \
    "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting

  # Install zsh-autosuggestions plugin, a plugin for fish-like suggestions.
  git clone https://github.com/zsh-users/zsh-autosuggestions --depth=1 \
    "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions

  install "${PWD}/dotfiles/zshrc" "${HOME}/.zshrc"
}

install_neovim() {
  sudo zypper install -y neovim
  "${SCRIPT_ROOT_DIR}"/lib/setup_neovim.sh
}

install_tmux() {
  sudo zypper install -y tmux
  install "${PWD}/dotfiles/tmux.conf" "${HOME}/.tmux.conf"
}

main() {
  sudo zypper dist-upgrade

  install_basic_tools
  install_zsh
  install_neovim
  install_tmux

  local instructions=""
  instructions+="[fcitx]: Set fcitx as a main input method using YaST.\n"
  instructions+="[fcitx]: Configure hangul input."

  success "${instructions}"
}

main "${@}"

