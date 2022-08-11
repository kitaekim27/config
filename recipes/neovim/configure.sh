#!/bin/bash
set -o errexit -o nounset -o errtrace -o pipefail

# Install vim-plug, a vim plugin manager.
# Check [https://github.com/junegunn/vim-plug] for detailed description.
curl -fLo "${XDG_DATA_HOME}/nvim/site/autoload/plug.vim" \
	--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# First, install plugins using vim-plug.
# At this point, in our init.lua, there should be no plugin-specific directives.
cp -rv "$(dirname $0)/nvim" ~/.config
nvim --headless -c "PlugInstall" -c "qa"

# Now, append plugin-specific directives into our init.lua.
cat <<EOF >>"${XDG_CONFIG_HOME}/nvim/init.lua"
require('init-autopairs')
require('init-coc')
EOF

cat <<EOF >>"${HOME}/.bashrc"
EDITOR="nvim"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
EOF

# Edit tmux.conf for vim-tmux-navigator plugin.
if [ -f ~/.tmux.conf ]; then
	cat <<-"EOF" >>~/.tmux.conf
		# Smart pane switching with awareness of vim splits.
		# See: https://github.com/christoomey/vim-tmux-navigator
		is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
				| grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
		bind -n M-h if-shell "$is_vim" "send-keys M-h" "select-pane -L"
		bind -n M-j if-shell "$is_vim" "send-keys M-j" "select-pane -D"
		bind -n M-k if-shell "$is_vim" "send-keys M-k" "select-pane -U"
		bind -n M-l if-shell "$is_vim" "send-keys M-l" "select-pane -R"
	EOF
fi
