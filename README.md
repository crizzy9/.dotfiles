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

### Consolidated TODO
- [ ] Update

### Supported Plugins

Below is a list of all the plugins supported by this repository, more to come...

#### Git

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

TODO: Make it work with raspi 2 ?
Raspi 1 working with minimal vim

Check raspberry pi os version

```sh
hostnamectl
# arm64 means 32 bit

# check bit with
getconf LONG_BIT
```

For 64 bit raspberry pi raspian

```sh
# download latest appimage from neovim github
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage

chmod u+x nvim.appimage && ./nvim.appimage
```

For 32 bit raspberry pi raspian

[Video Guide](https://www.youtube.com/watch?v=aOUwtTspALk)
> Note: Incomplete guide

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

----- Download rust binaries -----
# TODO: not working

cd ../..
# git clone git@pi-storage.local:/srv/tosh1/git/pi-cargo-bin
source "$HOME/.cargo/env"
# where to run?

# rustup component add tree-sitter # errors out since i was trying on 32bit raspbian aarch64
#cargo init
#cargo build
cargo install

----------------------------------

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

##### lazy nvim

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
> TODO: not working with libraries in python such as boto3.. no suggestion.. Working now using pyright lsp
> TODO: Java language server also not working - https://github.com/georgewfraser/java-language-server/issues/273

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

# keybindings
Ctrl + f      - fzf open nvim in directory
Ctrl + Space  - Accept suggestion from auto suggest
Tab           - Accept first suggestion from auto complete
- Search history with fzf
- cd to a folder with fzf

# aliases
exa - better ls - rename to ls

# working with foreground and background tasks
Ctrl + z - puts any current task in background
bg - list background tasks
fg %<num> - bring task to foreground
- using /dev/null 2>&1
```

### nvim shortcuts

leader key is mapped to `Space`

```text
# vim keybindings (https://neovim.io/doc/user/motion.html - for additional key bindings)
u - undo
Ctrl + r - redo
Ctrl + o - move backwards through the jump list
Ctrl + i - move forward to the next jump in the jumplist
Ctrl + t - move forward to next item in tag list (Works like a stack so only pops)
:jumps - view all jumps
:tags - view all tags
:e - update file to latest version when updated from elsewhere
:Lsp + Tab - Use Tab to autocomplete in status line

vt - select till - f for inclusive
vT - select back - F for inclusive
ZZ (:wq) (:x) - while in normal mode. Save and Exit
ZQ (:q!) - while in normal mode. Exit without saving
Ctrl + w + q - to quit a window (telescope)

# macros
q <register: a-z> {do stuff} q - record macro
@<register> - use macro
@@ - run last ran macro
. - repeat previous action (does not repeat motion keys)
- Check existing registers

# marks (used as bookmarks) - use harpoon?
g' or (:marks) - view all marks
g' <mark> - to go back to a specific mark
g' " - go back to last edited line
- Set a mark
- go back to mark

# which-key keybindings - check general keybindings
Ctrl + w - Opens menu for other keybindings
g - Open all g related shortcuts
g? - To open keymaps within certain things like nvim tree and mason

# Quick Movement keybindings
Ctrl + w + l - Move to right window pane
Ctrl + w + h - Move to left window pane
Ctrl + w + x - Switch splits
Ctrl + w + w - Cycle through window panes
gt - Next tab
gT - Previous tab
<num> gt - numbered tab
Ctrl + z (to exit) , fg (to re-enter) - Exit to Terminal an Return to current buffer

# git
- Open Git console
Space + h + s - Stage a hunk (a selection) from the current buffer
- Jump between hunks in the current file?

# nvim-tree (Working with folder structure and opened files)
## netrw is turned off - enable if needed - more info in nvim-tree readme
## TODO: create full side bar with git, active buffers as shown in (https://github.com/nvim-tree/nvim-tree.lua/issues/2255)
## TODO: Update to open the split next to the current window not in current window and move existing next to it
## TODO: open the same nvim tree in different tabs (https://github.com/nvim-tree/nvim-tree.lua/discussions/2244) (https://github.com/nvim-tree/nvim-tree.lua/issues/2255)
## more info on floating preview (https://github.com/nvim-tree/nvim-tree.lua/issues/135) (https://github.com/JMarkin/mynvim/blob/d733abb2ec72654211dafb089f237df9c2745758/lua/plugins/nvimtree.lua#L5) (https://github.com/JMarkin/nvim-tree.lua-float-preview)
(:NvimTreeToggle) - open file explorer
(:NvimTreeFindFileToggle) - Search in file explorer - TODO: Not working
Tab - open preview for a file
- exit preview?
a <filename> <CR> - create a new file/folder (while in nvimtree)
Ctrl + r - Rename a file in nvimtree (does not updated references with lsp) (TODO: update references, use telescope file browser maybe?, use https://github.com/nvim-tree/nvim-tree.lua/wiki/Extension-Plugins)
d - remove selected file (confirm with y)
Ctrl + k - View file size and other info
g? - To view shortcuts while in nvim tree

# neovim terminal emulator
## more info - (https://neovim.io/doc/user/nvim_terminal_emulator.html)
## modify terminal buffers with https://www.reddit.com/r/neovim/comments/cger8p/how_quickly_close_a_terminal_buffer/
(:terminal) - open neovim terminal emulator
- open terminal in horizontal/vertical split
Ctrl + \ + Ctrl + n - Go to normal mode from terminal mode
Ctrl + \ + Ctrl + o - Go to normal mode to run a single command then back to terminal mode
Ctrl + w + q (:q / :bd!) - exit neovim terminal emulator

# buffers
## %a - currently opened buffer, a - preview buffer closed when closed, #h - last opened buffer/file , h - file closed but buffer open
## + - represents file is unsaved but in buffer
## the buffers stay open by default even after :q - use :bd to delete buffer
Space + Space - Open list of active buffers (Telescope)
Ctrl + 6 - Open previously opened buffer, Or to toggle between 2 files easily (REMAP)
:q - keep buffer open
:bd - delete current buffer

# changing themes/highlighting etc
## show tab in a different way with x? (https://github.com/nvim-tree/nvim-tree.lua/issues/2255)

# lua basics
print("print something") - execute and print something in lua script
:messages - to view the output of the print statements in neovim
:lua vim.lsp.buf.formatting() - to call a lua function from status line

# Other useful info and commands and TODO
`:Telescope keymaps` - search LSP keymaps
`:Mason` + i - To install a new LSP server for a language
U (when in Mason) - Update lsp servers
g? (when in Mason) - To view additional info on mason
:Lazy - Open package manager installation
- Open command pallete?
K (in help man page) - Go to info about function while in :help pages

# LSP keymaps - Works if LSP installed and working and searches within workspace - how to debug?
## learn about LspAttach

## commands
:Mason - open mason
:Lspinfo - Lsp info for current project
:LspLog - Lsp logs
:LspStop /Start/Install - Other Lsp commands

## goto mappings
gr - Go to reference / Open lsp references
gd - Go to definition
gD - Go to declaration
gI - Go to implementation
gF - ?
gf - Go to file under cursor?
Space + D - Type Definition (Goes into packages also)
Space + d s - Search Document Symbols
Space + w s - Search Workspace Symbols - TODO: Not displaying anything

## utility mappings
Space + r n - Rename - Be careful Also Renames references
Space + c a - Code action
Space + w l - Workspace List Folders
Space + w a - Workspace Add Folder
Space + w r - Workspace Remove Folder

## lsp suggestion mappings
K - hover documentation , K again to go inside the hover
ctrl + k - signature documentation

# tree-sitter

## commands
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

## vim surround a block of text with braces / quotes etc

## move to keymapings. might work to extend visual selection
]m - move to next function
[m - move to previous function
]] - move to next class
[[ - move to previous class

# telescope

## telescope helpful commands
:Telescope keymaps - To view all telescope keybindings - n (normal) - keymap - function - description. Follow this format when adding new keybindings to show in telescope
:Telescope help_tags - To search for help across all of neovim
Esc + Esc - exit telescope

## telescope finder
### TODO: Shorten file paths especially in java for telescope finder
### Just hit SPACE to show some suggestions on what to do
### Just hit Space + ' to simliarly view other options
Space + s + f - telescope file search
Space + s + g - telescope in file grep
Space + Space - Open list of active buffers
Space + / - To search within current file
Space + s + / - To search within all open files
Space + ? - Search recently opened files
Space + s + r - Resume last search

## telescope file browser
- Open file explorer - use nvim tree
- Rename files in directory
- Add/Remove folders and files within telescope ? or use something else

## within telescope
Ctrl + p & Ctrl + n - Cycle through suggestions
Ctrl + t - Open file in new tab
Ctrl + v - Open in vertical window pane
Ctrl + x - Open in horizontal window pane
Ctrl + q - Open search in quickfix menu

# others
# TODO: setup keybinding and save setting for setting filetype and persist value
:set filetype=lua - to manually set a filetype
```
