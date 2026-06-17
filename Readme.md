Endless thank yous to my friends at [Ello](http://ello.co) and [Mode
Set](http://modeset.com/) for the not-so-basic configs. I've layered a few of my own on
top of this. See below for an overview of the magic...

![ello](http://d324imu86q1bqn.cloudfront.net/uploads/user/avatar/641/large_Ello.1000x1000.png
"ello")

We &hearts; the Neovim.


## Fresh install
**Warning this will blow away any nvim/zsh setups you have currently. You may
want to back up existing files.**

1. `xcode-select --install`
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- `brew install git neovim`
- cd to the dotfiles directory and `make install`
- Set reasonable [OSX defaults][osxdefaults]


## Settings

### Neovim Configuration

The Neovim configuration is built with modern Lua-based plugins:

- **Plugin Manager**: lazy.nvim
- **LSP**: Native LSP with Mason for language server management
- **Fuzzy Finder**: fzf-lua (replaces CtrlP)
- **File Tree**: neo-tree (replaces NERDTree)
- **Completion**: blink.cmp
- **Formatting**: conform.nvim with black/isort (Python), prettier (JS/TS), rubocop (Ruby)
- **Git Integration**: vim-fugitive, gitsigns
- **Theme**: Polarized (custom dark theme)

#### Key Bindings

- `F1` - Find files
- `F2` - Toggle file tree
- `F3` - Find buffers
- `F4` - Grep project
- `Space` - Leader key
- `gd` - Go to definition (LSP)
- `gr` - Go to references (LSP)
- `K` - Hover documentation (LSP)
- `<leader>rn` - Rename (LSP)
- `<leader>ca` - Code actions (LSP)

#### Python Support

Python development includes:
- Pyright LSP for type checking and intellisense
- Black + isort for formatting (runs on save)
- Virtual environment selector (`<leader>vs`)

### Override neovim settings

To override or add any additional settings create a `~/.config/nvim/init.local.lua` file and
add any customization.

### Git Configuration

Since the `.gitconfig` file does not contain any user info, create a `~/.gitconfig.local`
file with the following:

      [user]
        name = Your Name
        email = your@email
      [github]
        user = Your GitHub Username

## Tips

### Install polarized terminal theme

Included is a `polarized.terminal` color theme. Import this theme
into Apple's Terminal.app and set it as the default.

### First-time Neovim setup

After running `make install`, the first time you open Neovim it will:
1. Automatically install lazy.nvim plugin manager
2. Install all configured plugins
3. Set up LSP servers via Mason

This may take a minute or two on first launch.

<!-- Markdown links -->
[font]: https://github.com/andreberg/Meslo-Font
[mouseterm]: http://bitheap.org/mouseterm/
[osxdefaults]: http://mths.be/osx
[rbenv]: https://github.com/sstephenson/rbenv
[simbl]: http://www.culater.net/software/SIMBL/SIMBL.php

