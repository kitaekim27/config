#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

readonly RECIPES="bash fd fzf neovim tmux tree"

sudo pacman -Sy --noconfirm

sudo pacman -S --noconfirm reflector

sudo reflector \
  --save /etc/pacman.d/mirrorlist \
  --country "South Korea","Japan" \
  --sort rate

sudo pacman -Su --noconfirm

sudo pacman -S --noconfirm \
  $(cat packages.txt)

for recipe in ${RECIPES}; do
  "recipes/${recipe}/configure.sh"
done
