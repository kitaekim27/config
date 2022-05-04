#!/bin/bash
set -o errexit -o errtrace -o nounset -o pipefail

echo '
source /etc/os-release
if [[ "${NAME}" = "Ubuntu" ]]; then
  source /usr/share/doc/fzf/examples/completion.bash
  source /usr/share/doc/fzf/examples/key-bindings.bash
else
  source /usr/share/fzf/completion.bash
  source /usr/share/fzf/key-bindings.bash
fi' >> ~/.zshrc
