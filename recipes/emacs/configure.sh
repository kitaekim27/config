#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

systemctl --user enable emacs # Launch emacs daemon automatically.
# Install spacemacs, a modern emacs configuration framework.
# Check [https://www.spacemacs.org/] for detailed description.
[ -d "${HOME}/.emacs.d" ] && rm -rf "${HOME}/.emacs.d"
git clone -q "https://github.com/syl20bnr/spacemacs ${HOME}/.emacs.d"
