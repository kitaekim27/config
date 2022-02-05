#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

# Install bash-it, a community driven bash configuration framework.
[[ -d ~/.bash_it ]] && rm -rf ~/.bash_it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh -saf
sed -i "s/BASH_IT_THEME='*'/BASH_IT_THEME='easy'/p" ~/.bashrc

# Copy general configuration.
cat bashrc >> ~/.bashrc
