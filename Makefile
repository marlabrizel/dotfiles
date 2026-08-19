# Main targets
.PHONY: help install update vim nvim zsh dots world bash ghostty claude

#/ HELP            List all make targets
help:
	@grep -E '^#/' Makefile | cut -c4-

#/ update          Update all configurations
update: vim-update nvim-update

#/ install         Install all configurations
install: world

#/ world           Complete installation of all dotfiles
world: dots nvim zsh ghostty claude

#/ dots            Install common dotfiles (.gemrc, .gitconfig, etc.)
dots:
	@echo "Installing dotfiles..."
	@mkdir -p $(HOME)/.bundle
	@ln -sfv $(PWD)/dots/bundle/config $(HOME)/.bundle/config
	@for file in gemrc gitconfig gitignore jshintrc; do \
		ln -sfv $(PWD)/dots/$$file $(HOME)/.$$file; \
	done

#/ vim             Install vim configuration with vim-plug
vim: vim-directories vim-symlinks vim-plug vim-plugins

vim-directories:
	@echo "Creating vim directories..."
	@rm -rf $(HOME)/.vim
	@mkdir -pv $(HOME)/.vim/autoload
	@mkdir -pv $(HOME)/.vim/plugged
	@mkdir -pv $(HOME)/.vim/colors
	@mkdir -pv $(HOME)/.vim/tmp/swap
	@mkdir -pv $(HOME)/.vim/tmp/yankring
	@mkdir -pv $(HOME)/.vim/tmp/ctrlp

vim-symlinks:
	@echo "Creating vim symlinks..."
	@ln -sfv $(PWD)/dots/vimrc $(HOME)/.vimrc
	@ln -sfv $(PWD)/dots/vim/colors/polarized.vim $(HOME)/.vim/colors/

vim-plug:
	@echo "Installing vim-plug..."
	@curl -fLo $(HOME)/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim-plugins:
	@echo "Installing vim plugins..."
	@vim +PlugInstall +qall

vim-update:
	@echo "Updating vim plugins..."
	@vim +PlugUpdate +qall

#/ zsh             Install zsh configuration
zsh: zsh-files zsh-symlinks

zsh-files:
	@echo "Creating zsh configuration files..."
	@mkdir -p $(HOME)/.zsh

zsh-symlinks:
	@echo "Creating zsh symlinks..."
	@ln -sfv $(PWD)/dots/zshrc $(HOME)/.zshrc
	@ln -sfv $(PWD)/dots/zshenv $(HOME)/.zshenv
	@ln -sfv $(PWD)/dots/zprofile $(HOME)/.zprofile

#/ bash            Install bash configuration
bash:
	@echo "Installing bash configuration..."
	@for file in bash_profile bashrc inputrc; do \
		ln -sfv $(PWD)/dots/$$file $(HOME)/.$$file; \
	done

#/ nvim            Install neovim configuration
nvim: nvim-directories nvim-symlinks

nvim-directories:
	@echo "Creating nvim directories..."
	@mkdir -pv $(HOME)/.config

nvim-symlinks:
	@echo "Creating nvim symlinks..."
	@rm -rf $(HOME)/.config/nvim
	@ln -sfv $(PWD)/dots/nvim $(HOME)/.config/nvim

nvim-update:
	@echo "Updating nvim plugins..."
	@nvim --headless "+Lazy! sync" +qa

#/ ghostty         Install ghostty configuration
ghostty: ghostty-directories ghostty-symlinks

ghostty-directories:
	@echo "Creating ghostty directories..."
	@mkdir -pv $(HOME)/.config

ghostty-symlinks:
	@echo "Creating ghostty symlinks..."
	@rm -rf $(HOME)/.config/ghostty
	@ln -sfv $(PWD)/dots/ghostty $(HOME)/.config/ghostty

#/ claude          Install Claude Code configuration
claude: claude-directories claude-symlinks

claude-directories:
	@echo "Creating claude directories..."
	@mkdir -pv $(HOME)/.claude
	@mkdir -pv $(HOME)/.config

claude-symlinks:
	@echo "Creating claude symlinks..."
	@ln -sfv $(PWD)/dots/claude/settings.json $(HOME)/.claude/settings.json
	@rm -rf $(HOME)/.config/ccstatusline
	@ln -sfv $(PWD)/dots/ccstatusline $(HOME)/.config/ccstatusline
