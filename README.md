# Dotfiles

This repository contains dotfile configurations for several different terminal based applications
Author: @crizzy9

## Table of Contents

- Installation
- Supported Plugins
  - nvim/vim
  - zsh
  - git
  - homebrew/apt
  // todo:
  - iterm/termintor/tmux
  - btop
  - ripgrep/fzf
  - ranger
  - zathura
  - entr/cron
  - ~~ctags~~

// Add a Custom Keyboard shortcut guide

## Installation

// Insert image for the interface and usage instructions

Install git and xcode first (`$ xcode-select --install`) if on macos
Install terminator/kitty and tmux
firstly install homebrew, zsh and iterm seperately not working on their own
zsh will link to pre oh my zsh
Also neovim plugins will need to be installed externally
Will need to install zsh plugins externally as well
along with nerd fonts and maybe something else as well

```sh
# chmod not required anymore
chmod +x ./install #to resolve permission denied error and give execute permission
./install
```

### Supported Plugins

Below is a list of all the plugins supported by this repository, more to come...

#### ZSH

After installation run the following to get the latest znap dependencies

```sh
znap pull
```

Remove old `~/.zshrc.zwc` file if changes not taking effect
Also check `echo $ZDOTDIR`
After installation is done
iTerm > Preferences > Profile > Text > Font > Hack Nerd Font

#### Neovim

Use [Neovim kickstart](https://github.com/nvim-lua/kickstart.nvim)
