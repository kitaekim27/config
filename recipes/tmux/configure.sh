#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

install -v tmux.conf ~/.tmux.conf

echo '
# If the shell is not running on a ssh connection, create a new tmux session.
[ -z "${SSH_CLIENT}" ] && [ -z "${SSH_TTY}" ] \
  && command -v tmux &> /dev/null && [ -z "${TMUX}" ] \
  && exec tmux
' >> ~/.bashrc
