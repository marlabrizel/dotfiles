Endless thank yous to my friends at [Ello](http://ello.co) and [Mode
Set](http://modeset.com/) for the not-so-basic configs. I've layered a few of my own on
top of this. See below for an overview of the magic...

![ello](http://d324imu86q1bqn.cloudfront.net/uploads/user/avatar/641/large_Ello.1000x1000.png
"ello")

We &hearts; the Vim.


## Fresh install
**Warning this will blow away any vim/bash setups you have currently. You may
want to back up existing files.**

1. `xcode-select --install`
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- `brew install git`
- cd to the dotfiles directory and `bin/install world`
- Set reasonable [OSX defaults][osxdefaults]


## Settings

### Rock a sweet Bash setup

The Bash setup is fairly bare bones out of the box. To override or add
any additional settings create a `~/.bashrc.local` file and add
any customization.

Within this file you should have the following environment variables
set:

      export GIT_AUTHOR_NAME='Your Name'
      export GIT_AUTHOR_EMAIL='your@email'
      export GIT_COMMITTER_NAME='Your Name'
      export GIT_COMMITTER_EMAIL='your@email'
      export GITHUB_USER='Your GitHub Username'

Since the `.gitconfig` file does not contain any user info, these are
required to identify who you are. 

The default Bash settings support the [rbenv][rbenv] environment.

### Override vim settings

To override or add any additional settings create a `~/.vimrc.local` file and
add any customization.

## Tips

### Install polarized terminal theme

Included is a `polarized.terminal` color theme. Import this theme
into Apple's Terminal.app and set it as the default.

### Mouse support for Terminal

To get full mouse support (scrolling, clicking, etc...) within Terminal
Vim, install the [SIMBL][simbl] [MouseTerm][mouseterm] plug-in. It brings the
goodness.

<!-- Markdown links -->
[font]: https://github.com/andreberg/Meslo-Font
[mouseterm]: http://bitheap.org/mouseterm/
[osxdefaults]: http://mths.be/osx
[rbenv]: https://github.com/sstephenson/rbenv
[simbl]: http://www.culater.net/software/SIMBL/SIMBL.php

