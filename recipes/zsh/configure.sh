#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

# Install oh-my-zsh, a zsh configuration framework.
# Check [https://github.com/ohmyzsh/ohmyzsh] for detailed description.
[ -d "${HOME}/.oh-my-zsh" ] && rm -rf "${HOME}/.oh-my-zsh"
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

install -v $(dirname $0)/zshrc ~/.zshrc

sudo chsh -s /usr/bin/zsh "${USER}" # Set the zsh as a default login shell.

