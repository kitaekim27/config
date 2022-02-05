#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

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

install -v zshrc ~/.zshrc
