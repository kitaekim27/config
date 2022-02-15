#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

install -v tmux.conf ~/.tmux.conf

echo '
command -v tmux &> /dev/null \
  && [ -z "${SSH_CLIENT}" ] \
  && [ -z "${SSH_TTY}" ] \
  && [ -z "${TMUX}" ] \
  && exec tmux
' >> ~/.bashrc
