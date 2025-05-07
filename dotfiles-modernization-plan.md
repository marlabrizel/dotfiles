# Dotfiles Modernization Plan

This document outlines the plan for modernizing the dotfiles repository by:
1. Migrating from Pathogen to vim-plug for VIM plugin management
2. Making dotfiles compatible with zsh
3. Simplifying the structure by consolidating installation logic in the Makefile

## 1. Simplified Structure

### Current Structure
```
dotfiles/
├── bin/
│   ├── help
│   ├── install
│   ├── uninstall
│   └── update
├── dots/
│   ├── bash_profile
│   ├── bashrc
│   ├── vimrc
│   └── ...
├── packages/
│   └── bundles.txt (to be removed)
└── Makefile
```

### New Structure
```
dotfiles/
├── dots/
│   ├── bash_profile
│   ├── bashrc
│   ├── vimrc (with direct plugin definitions)
│   ├── zshrc (new)
│   ├── zshenv (new)
│   └── ...
└── Makefile (enhanced)
```

## 2. New Makefile Structure

The new Makefile will incorporate all the functionality previously in the `bin/` directory:

```makefile
# Main targets
.PHONY: help install update vim zsh dots world

# Help target
help:
	@grep -E '^#/' Makefile | cut -c4-

#/ update          Update all configurations
update: vim-update

#/ install         Install all configurations
install: world

#/ world           Complete installation of all dotfiles
world: dots vim zsh

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
```

## 3. vim-plug Migration

### Updated .vimrc Structure

The updated `.vimrc` will replace Pathogen with vim-plug and directly define all plugins:

```vim
" Disable vi compatibility
set nocompatible

" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Plugins
" File navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'

" Language support
Plug 'w0rp/ale'
Plug 'slashmili/alchemist.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Keithbsmiley/swift.vim'

" HTML/CSS
Plug 'tysontate/HTML-AutoCloseTag'
Plug 'othree/html5.vim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editing enhancements
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'vim-scripts/YankRing.vim'
Plug 'henrik/vim-indexed-search'
Plug 'nelstrom/vim-visual-star-search'
Plug 'prettier/vim-prettier'
Plug 'ngmy/vim-rubocop'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'kien/rainbow_parentheses.vim'

" UI enhancements
Plug 'vim-airline/vim-airline'
Plug 'mkitt/tabline.vim'
Plug 'mkitt/markdown-preview.vim'

" Initialize plugin system
call plug#end()

" Rest of the existing vimrc content...
" (Preferences, plugin configurations, key mappings, etc.)
```

## 4. zsh Configuration

### .zshrc

```zsh
# Environment pathing and editor defaults
eval $(/opt/homebrew/bin/brew shellenv)
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/heroku/bin:$PATH"
export LC_ALL=C
export ARCHFLAGS="-arch i386 -arch x86_64"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

# Add some color to man pages
export LESS_TERMCAP_md="$(tput setaf 4)"

# Use MacVim's version of the Vim executable instead of the systems
if [ -e /opt/homebrew/bin/brew ]; then
  export MACVIM_BASE=`brew --cellar macvim`
  export MACVIM_VERSION=`brew list --versions macvim | cut -d ' ' -f 2`
  alias vim="$MACVIM_BASE/$MACVIM_VERSION/MacVim.app/Contents/MacOS/Vim"
fi

export EDITOR=vim

# zsh options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt AUTO_CD
setopt CORRECT
setopt COMPLETE_IN_WORD

# Color settings
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='0;36'
export CLICOLOR=1
export LSCOLORS=excxgxfxbxdxbxbxbxexex

# Prompt configuration
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' [%b]'
setopt PROMPT_SUBST
PROMPT='%F{magenta}[%m]%f %F{blue}%1~%f%F{green}$([ -n "$(rbenv version-name 2>/dev/null)" ] && echo " [$(rbenv version-name)]")%f%F{red}${vcs_info_msg_0_}%f '
RPROMPT=''

# Aliases
# Map git commands through hub
if [ -e /usr/local/bin/hub ]; then
  alias git=hub
fi

# Handy stuff
alias reload="source ~/.zshrc && cd ../ && cd -"
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -G'
alias la='ls -lA'
alias ll='ls -l'
alias las='ls -lAS'
alias hi='history | tail -50'
alias be='bundle exec'
alias lf='lein figwheel'
alias rlf='rlwrap lein figwheel'
alias lr='lein repl'
alias ..="cd ../"
alias ...="cd ../../"
alias dc='docker compose'
alias lint='bundle exec rubocop --display-only-fail-level-offenses'
alias deps="RUBYOPT='-W:deprecated'"

alias git-prune='git remote | xargs -n1 git remote prune'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias ugh='git reset --hard'
alias gra='git remote add'
alias gam='git commit --amend --no-edit'
alias gcp='git cherry-pick'

alias yolo='bundle exec rake db:drop db:setup'

# SMAR
export AWS_PROFILE=content-integration-dev
alias awssso='aws sso login'
alias ai-sandbox='export AWS_PROFILE=prod-eng-ai-sandbox ; aws sso login --profile prod-eng-ai-sandbox'

# Disable precommit hooks
export HUSKY_SKIP_INSTALL=1
export HUSKY_SKIP_HOOKS=1

# Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Initialize rbenv and nodenv
eval "$(rbenv init -)"
eval "$(nodenv init -)"

# Load local config if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
```

### .zshenv

```zsh
# Environment variables that should be available to all shells
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/heroku/bin:$PATH"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export GOPATH=~/Documents/code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# SDKMAN setup
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

### .zprofile

```zsh
# This file is sourced only for login shells
# It's the zsh equivalent of .bash_profile

# Source .zshrc for login shells
[[ -f ~/.zshrc ]] && source ~/.zshrc
```

## 5. Implementation Steps

1. Create the new Makefile
2. Update the vimrc file to use vim-plug with direct plugin definitions
3. Create the zsh configuration files
4. Test the installation process
5. Remove the redundant bin/ directory and packages/bundles.txt

## 6. Testing Plan

1. Test vim-plug installation and plugin management
2. Test zsh configuration and functionality
3. Verify that all dotfiles are properly symlinked
4. Ensure compatibility with existing tools and workflows