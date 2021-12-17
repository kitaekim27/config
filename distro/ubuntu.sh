#!/bin/bash
# Last update: 12.17.2021
#
# Installation script for Ubuntu.

set -o errexit -o nounset -o errtrace -o pipefail

source "${SCRIPT_ROOT_DIR}"/lib/common.sh

install_basic_tools() {
  sudo apt-get install -yq \
    python-is-python3 python3-pip \
    build-essential bear clangd gdb git \
    curl wget net-tools \
    silversearcher-ag fd-find
}

install_fcitx_hangul() {
  sudo apt-get install -yq fcitx-hangul
  im-config -n fcitx # Set the fcitx as a default input method.
}

install_zsh() {
  sudo apt-get install -yq zsh
  sudo chsh -s /usr/bin/zsh "${USER}" # Set the zsh as a default login shell.

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

install_bash() {
  # Install bash-it, a community driven bash configuration framework.
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
  ~/.bash_it/install.sh
  sed -i "s/BASH_IT_THEME='*'/BASH_IT_THEME='easy'/p" ~/.bashrc

  # Copy general configuration.
  cat "${PWD}/dotfiles/bashrc" >> "${HOME}/.bashrc"
}

install_emacs() {
  sudo apt-get install -yq emacs
  systemctl --user enable emacs # Launch emacs daemon automatically.

  # Install spacemacs, a modern emacs configuration framework.
  # Check [https://www.spacemacs.org/] for detailed description.
  [ -d "${HOME}/.emacs.d" ] && rm -rf "${HOME}/.emacs.d"
  git clone -q "https://github.com/syl20bnr/spacemacs ${HOME}/.emacs.d"
}

install_tmux() {
  sudo apt-get install -yq tmux
  install "${PWD}/dotfiles/tmux.conf" "${HOME}/.tmux.conf"
}

install_node() {
  # Install nodejs, a JavaScript runtime.
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
}

install_neovim() {
  sudo apt-get install -y neovim
  "${SCRIPT_ROOT_DIR}"/lib/setup_neovim.sh
}

install_gef() {
  # Install GEF, an extended GDB.
  # Check [https://github.com/hugsy/gef] for detailed description.

  # Note that you can't use zsh here.
  wget -qO- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | bash

  pip -q install capstone unicorn keystone-engine ropper
}

install_lxd() {
  sudo apt-get install -yq lxd
  sudo usermod -aG lxd "${USER}"
  yes '' | lxd init # Initialize the LXD with default options.
  install "${PWD}/scripts/lxd/*" "${HOME}/.local/bin/"
}

install_fzf() {
  [[ -d ~/.fzf ]] && rm -rf ~/.fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  # I know this looks weird but fzf's installation script sucks too much. It fails every time
  # even after successful installation. Deal with it.
  yes "y" | ~/.fzf/install || :
}

main() {
  sudo apt-get update -yq
  sudo apt-get upgrade -yq

  install_basic_tools
  install_fcitx_hangul
  install_bash
  install_node
  install_neovim
  install_tmux
  install_fzf

  sudo apt-get autoclean -yq
  sudo apt-get autoremove -yq

  local instructions=""
  instructions+="[fcitx]: Set fcitx as a main input method.\n"
  instructions+="[fcitx]: Configure hangul input."

  success_installation "${instructions}"
}

main "${@}"

