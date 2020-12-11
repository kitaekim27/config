#!/bin/sh -eu

setup_basic_tools()
{
	sudo apt-get install -yq build-essential curl wget gdb git net-tools bear
}

setup_fcitx_hangul()
{
	sudo apt-get install -yq fcitx-hangul
	im-config -n fcitx # Set default input method.
}

setup_zsh()
{
	sudo apt-get install -yq zsh
	sudo chsh -s /usr/bin/zsh ${USER} # Change default login shell.

	# Install oh-my-zsh, a zsh configuration framework.
	# Check [https://github.com/ohmyzsh/ohmyzsh] for detailed description.
	[ -d ${HOME}/.oh-my-zsh ] && rm -rf ${HOME}/.oh-my-zsh
	curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh
	install ${PWD}/dotfiles/zshrc ${HOME}/.zshrc
}

setup_nvm()
{
	# Node Version Manager.
	# Check [https://github.com/nvm-sh/nvm] for detailed description.
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | zsh
	source ~/.zshrc # TOOD: This command freqeuntly fails due to unexpected newline error.
	[ command -v nvm ] && nvm install node
}

setup_neovim()
{
	# Fork of good old vim.
	# Check [https://github.com/neovim/neovim] for detailed description.
	sudo apt-get install -yq neovim

	# Install vim-plug. Check [https://github.com/junegunn/vim-plug].
	curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
		--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	install -D "${PWD}/dotfiles/init.vim" ${HOME}/.config/nvim/init.vim
	nvim --headless +PlugInstall +qa
}

setup_emacs()
{
	sudo apt-get install -yq emacs
	systemctl --user enable emacs # Launch emacs server automatically.

	# Install spacemacs, a emacs configuration framework.
	# Check [https://www.spacemacs.org/] for detailed description.
	[ -d ${HOME}/.emacs.d ] && rm -rf ${HOME}/.emacs.d
	git clone -q https://github.com/syl20bnr/spacemacs ${HOME}/.emacs.d
}

setup_tmux()
{
	sudo apt-get install -yq tmux
	install "${PWD}/dotfiles/tmux.conf" ${HOME}/.tmux.conf
}

setup_gef()
{
	# Extended GDB.
	# Check [https://github.com/hugsy/gef] for detailed description.
	wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh
	command -v pip3 &> /dev/null || sudo apt-get install -yq python3-pip
	pip3 -q install unicorn capstone ropper keystone
}

setup_lxd()
{
	sudo apt-get install -yq lxd
	sudo usermod -aG lxd ${USER}

	# Install scripts for LXD.
	install ${PWD}/scripts/lxd/* ${HOME}/.local/bin/
}

sudo apt-get update -yq
sudo apt-get upgrade -yq

setup_basic_tools
setup_fcitx_hangul
setup_zsh
setup_nvm
setup_neovim
setup_tmux
setup_gef
setup_lxd

sudo apt-get autoclean -yq
sudo apt-get autoremove -yq
