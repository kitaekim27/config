#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

install -v $(dirname $0)/tmux.conf ~/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cat << 'EOF' >> ~/.zshrc
command -v tmux &> /dev/null \
  && [ -z "${SSH_CLIENT}" ] \
  && [ -z "${SSH_TTY}" ] \
  && [ -z "${TMUX}" ] \
  && exec tmux

EOF
