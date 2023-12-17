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
- TODO:
  - iterm/termintor/tmux
  - btop
  - ripgrep/fzf
  - ranger
  - zathura
  - entr/cron
  - ~~ctags~~
- Custom Keybidings

## Installation

The installation is done via the installation script `install`
This will install all the required plugins and configurations based on user input as shown below

![installer](./installer.png)

Perform the following steps as per your operating system then install via the script

### MacOs

- Installing **git**
- Install **xcode** by running `$ xcode-select --install`
- Install **homebrew**
- install **unicode fonts**

### Linux

- Install **terminator/kitty** and **tmux**
- Install **unicode fonts**

### Windows

- Install your **favorite terminal**
- TODO

>***Start installation*** with the following commands and follow the prompts
>Note: Refer to plugin instructions for additional customization
>Note: If you dont have experience with symlinks use the test folder to check

```sh
# give execute permissions
chmod +x ./install
# start installer
./install
```

### Supported Plugins

Below is a list of all the plugins supported by this repository, more to come...

### Git

TODO

#### ZSH

After installation run the following to get the latest znap dependencies

```sh
znap pull
```

Remove old `~/.zshrc.zwc` file if changes not taking effect
Also check `echo $ZDOTDIR`
After installation is done
iTerm > Preferences > Profile > Text > Font > Hack Nerd Font

TODO: fix hanging on up arrow key in macos

#### Neovim

You can either setup [Neovim kickstart](https://github.com/nvim-lua/kickstart.nvim) or do a custom setup for nvim

Install neovim plugins
>Note: Make sure you have `ripgrep` and `fzf` installed for telescope to work. Plugins are installed with `mason` and `packer`

###### installing neovim on linux - raspberry pi

```sh
sudo apt install binutils
sudo apt install build-essential
sudo apt install cmake ninja-build
git config --global init.defaultBranch main
mkdir neovym
cd neovym
git clone https://github.com/neovim/neovim.git
cd neovim
mkdir build
mkdir .deps
cd .deps
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ../cmake.deps/
ninja
which curl
# install rust compilers
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

-----
cd ../..
# git clone git@pi-storage.local:/srv/tosh1/git/pi-cargo-bin
source "$HOME/.cargo/env"
 # where to run?
cargo build
cargo install

# once cargo installs binaries in folder ~/neovym/pi-cargo-bin
cd pi-cargo-bin
ls
# should show fd rg rustdoc sccache starship tree-sitter
# copy all libraries to ~/.cargo/bin
# cp ./* ~/.cargo/bin/*
cp ./fd ~/.cargo/bin
cp ./rg ~/.cargo/bin
cp ./rustdoc ~/.cargo/bin
cp ./sccache ~/.cargo/bin
cp ./starship ~/.cargo/bin
cp ./tree-sitter ~/.cargo/bin

cd ~
vim .profile
# add --- . "$HOME/.cargo.env"
# add to .zshrc as well
vim ~/.zshrc
# eval "$(starship init bash)"
eval "$(starship init zsh)"
source ~/.zshrc

#Video: 11:08
```

> Note: Try these in docker first if you want to test - details found on github

##### kickstart nvim

```sh
nvim # say yes to install plugins
:wq
nvim # should start installing lsp servers now
```

##### lunar nvim

```sh
TODO
```

##### custom nvim

```sh
nvim
```

##### minimal vim

```sh
# TODO
```

###### configuration

LSP and mason config
> TODO: not working with libraries in python such as boto3.. no suggestion.. need to debug

```
To add more plugins in init.lua packer config
:Mason -> i - install lsp for a language, select python and press i

Once installation is complete quit nvim and restart to show suggestions when typing - Cycle through with Ctrl+n/p

When installing a new lsp server `on_attach` function is called in init.lua to configure
local servers = {} lists default servers
```

setup functions for plugins within kickstart

```
## remove .setup functions from init.lua if you dont want the plugin
## check for help of specific plugin with :help plugn ... instructions in init.lua
```

## Custom Keybindings

Custom keybindings for zsh, nvim and ranger

### terminator shortcuts

```text
Ctrl + Shift + e - Vertical pane
Ctrl + Shift + o - Vertical pane
Ctrl + Shift + n - cycle through panes
Ctrl + Shift + x - maximize active pane
Ctrl + Shift + f - search in terminal backlog
```

### zsh shortcuts

```text
# TODO: doesnt work in linux
Ctrl + f - fzf open nvim in directory
```

### nvim shortcuts

leader key is mapped to `Space`

```text
# vim keybindings
u - undo
Ctrl+r - redo

# general keybindings
- Move to right window pane
- Move to left window pane
- Switch between tabs
- Open Git console

# LSP keymaps - Works if LSP installed and working and searches within workspace - how to debug?

## info
`:Telescope keymaps` - search LSP keymaps
`:Mason` + i - To install a new LSP server for a language
- Update lsp servers? Automatic?

## goto mappings
gr - Go to reference / Open lsp references
gd - Go to definition
gD - Go to declaration
gI - Go to implementation
Space + D - Type Definition
Space + d s - Search Document Symbols
Space + w s - Search Workspace Symbols - TODO: Not displaying anything

## utility mappings
Space + r n - Rename - Be careful Also Renames references
Space + c a - Code action
Space + w l - Workspace List Folders
Space + w a - Workspace Add Folder
Space + w r - Workspace Remove Folder

## lsp suggestion mappings
K - hover documentation
ctrl + k - signature documentation

# tree-sitter

## info
`:TSUpdate` - update added languages
- install new language support?

## basic keymaps
Ctrl + Space - incremental highlight syntactic region. word-line-block-function-class
Ctrl + Backspace - decrement highlight syntactic region. word-line-block-function-class

## visual selection bindings - start with v
v aa - visual select to around param - including spaces, commas and such
v ia - move visual selection to previous param
v af - move visual selection to next function
v if - move visual selection to previous function
v ac - move visual selection to next class
v ic - move visual selection to previous class
v ab - visual selection around brackets including brackets
v ib - visual selection inside brackets excluding brackets

## move entire visual selection? does that work?

## move to keymapings. might work to extend visual selection
]m - move to next function
[m - move to previous function
]] - move to next class
[[ - move to previous class

# telescope

## telescope helpful commands
:Telescope keymaps - To view all telescope keybindings - n (normal) - keymap - function - description. Follow this format when adding new keybindings to show in telescope
:Telescope help_tags - To search for help across all of neovim

## telescope finder
## Just hit SPACE to show some suggestions on what to do
Space + s + f - telescope file search
Space + s + g - telescope in file grep
Space + Space - Open list of active buffers
Space + / - To search within current file
Space + s + / - To search within all open files
Space + ? - Search recently opened files
- Open file explorer

## within telescope
Ctrl + p & Ctrl + n - Cycle through suggestions
Ctrl + t - Open file in new tab
- Open in vertical window pane
- Open in horizontal window pane
- Open search in quickfix menu
- Add/Remove folders and files within telescope

# others
# TODO: setup keybinding and save setting for setting filetype
:set filetype=lua - to manually set a filetype
```
