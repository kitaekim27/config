#!/bin/bash
set -o errexit -o errtrace -o nounset -o pipefail

source /etc/os-release

if [ "${NAME}" = "Ubuntu" ]; then
  cat <<-EOF >> ~/.zshrc

	source /usr/share/doc/fzf/examples/completion.zsh
	source /usr/share/doc/fzf/examples/key-bindings.zsh

EOF
else
  cat <<-EOF >> ~/.zshrc

	source /usr/share/fzf/completion.zsh
	source /usr/share/fzf/key-bindings.zsh

EOF
fi

