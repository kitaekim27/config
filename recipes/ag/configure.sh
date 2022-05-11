#!/bin/bash
set -o errexit -o errtrace -o nounset -o pipefail

echo 'alias a="ag --number"' >> ~/.zshrc
