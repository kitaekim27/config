#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

# Install oh-my-zsh, a zsh configuration framework.
# Check [https://github.com/ohmyzsh/ohmyzsh] for detailed description.
[ -d "${HOME}/.oh-my-zsh" ] && rm -rf "${HOME}/.oh-my-zsh"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install basic zshrc.
install -v $(dirname $0)/zshrc ~/.zshrc
# Install fish-like autosuggestion plugin for zsh.
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
# Install fish-like syntax highlighting plugin for zsh.
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sudo chsh -s $(which zsh) "${USER}" # Set the zsh as a default login shell.
