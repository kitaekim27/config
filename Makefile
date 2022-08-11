TARGETS = ag bash emacs fd fzf neovim rclone tmux tree zsh test

.PHONY : all $(TARGETS) format

all: $(TARGETS)

$(TARGETS):
	@$(CURDIR)/recipes/$@/configure.sh

format:
	@shfmt -bn -w $(CURDIR)
