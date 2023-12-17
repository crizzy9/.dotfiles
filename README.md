This repository contains dotfile configurations for the following applications

TODO: Link to sections on readme
- Vim
- Zsh
- git
- Homebrew
- iterm
- ctags
- Ranger
- fzf
- zathura
- entr/cron

It also contains a Custom Keyboard shortcut guide

# Installation

--------------

## General

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

## ZSH



Remove old `~/.zshrc.zwc` file if changes not taking effect
Also check `echo $ZDOTDIR`
After installation is done
iTerm > Preferences > Profile > Text > Font > Hack Nerd Font

## Neovim
