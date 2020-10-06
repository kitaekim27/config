#!/usr/bin/env bash

set -euo pipefail

function setup_packages
{
	sudo apt-get install -yq build-essential
	sudo apt-get install -yq curl
	sudo apt-get install -yq gdb
	sudo apt-get install -yq git
	sudo apt-get install -yq net-tools
	sudo apt-get install -yq wget
	sudo apt-get install -yq bear
}

function setup_fcitx
{
	sudo apt-get install -yq fcitx-hangul
	im-config -n fcitx
}

function setup_zsh
{
	sudo apt-get install -yq zsh
	sudo chsh -s /usr/bin/zsh ${USER}
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh
	cp ${PWD}/dotfiles/zshrc ${HOME}/.zshrc
}

function setup_neovim
{
	sudo apt-get install -yq neovim
	# Install vim-plug. (see: https://github.com/junegunn/vim-plug)
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
		--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	[ -d ${HOME}/.config/nvim ] || mkdir -p ${HOME}/.config/nvim
	cp "${PWD}/dotfiles/init.vim" ${HOME}/.config/nvim/init.vim
	nvim --headless +PlugInstall +qa
}

function setup_emacs
{
	sudo apt-get install -yq emacs
	[ -d ${HOME}/.emacs.d ] && rm -rf ${HOME}/.emacs.d
	git clone -q https://github.com/syl20bnr/spacemacs ${HOME}/.emacs.d
	systemctl --user enable emacs # Launch emacs server automatically.
}

function setup_tmux
{
	sudo apt-get install -yq tmux
	cp "${PWD}/dotfiles/tmux.conf" ${HOME}/.tmux.conf
}

function setup_gef
{
	sh -c "$(wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh)"
	command -v pip3 &> /dev/null || sudo apt-get install -yq python3-pip
	pip3 -q install unicorn
	pip3 -q install capstone
	pip3 -q install ropper
	pip3 -q install keystone
}

function setup_lxd
{
	sudo apt-get install -yq lxd
	sudo usermod -aG lxd ${USER}
}

function main
{
	sudo apt-get update -yq
	#sudo apt-get upgrade -yq

	setup_packages
	setup_fcitx
	setup_zsh
	setup_neovim
	setup_tmux
	setup_gef
	setup_lxd

	sudo apt-get autoclean -yq
	sudo apt-get autoremove -yq

	echo "All processes complete!"
}

main
