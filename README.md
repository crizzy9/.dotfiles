# Dotfiles

This repository contains dotfile configurations for several different terminal based applications
Author: @crizzy9

# Table of Contents

- Installation
- Supported Plugins
  - nvim/vim
  - zsh
  - ripgrep/fd/fzf
  - bat
  - homebrew/apt
- TODO:
  - git
  - ranger/broot/zoxide
  - iterm/termintor/alacritty/tmux/kitty/wezterm
  - yabai
  - btop
  - zathura
  - entr/cron
  - ~~ctags~~
- Custom Keybidings

# Installation

The installation is done via the installation script `install`
This will install all the required plugins and configurations based on user input as shown below

![installer](./installer.png)

Perform the following steps as per your operating system then install via the script

## Operating Systems

### MacOs

- Install **xcode** by running `$ xcode-select --install`
- Install **homebrew** and add the following to zprofile https://github.com/orgs/Homebrew/discussions/446
- install **unicode fonts** - Nerd Fonts
- Install Firefox with Tridactyl for vim like browser
- Install favorite terminal Wezterm/Kitty/Alacritty


### Linux
**N.B.**: Only supported Debian/Ubuntu for now

- Install favorite terminal
- Install **terminator/kitty** and **tmux**
- Install **unicode fonts**

### Windows

- TODO

## Instructions
>***Start installation*** with the following commands and follow the prompts
>Note: Refer to plugin instructions for additional customization
>Note: If you dont have experience with symlinks use the test folder to check

```sh
# give execute permissions
chmod +x ./install
# start installer
./install
```

# Plugins

Below is a list of all the plugins supported by this repository, more to come...

## Git

Plugin setup. TODO setup [2 gitconfigs](https://blog.hao.dev/how-to-use-different-git-emails-for-personal-and-work-repositories-on-the-same-machine) one for work and another for personal


## ZSH

After installation run the following to get the latest znap dependencies
If znap is not working with error, upgrade zsh version to 5.8+

```sh
znap pull
```

Remove old `~/.zshrc.zwc` file if changes not taking effect
Also check `echo $ZDOTDIR`
After installation is done
iTerm > Preferences > Profile > Text > Font > Hack Nerd Font

TODO: fix hanging on up arrow key in macos

## Bat
Enhanced cat to view files at a glance. Useful with fzf and ranger

```sh
bat --diagnostic
bat --list-languages
bat --list-themes

bat --list-languages | fzf --ansi --no-preview
```

## Ranger
TODO

## Terminal

### Wezterm
Install wezterm from source: https://wezfurlong.org/wezterm/install/linux.html#installing-on-ubuntu-and-debian-based-systems

### Alacritty
Install using brew `brew install --cask alacritty --no-quarantine`
https://github.com/alacritty/alacritty/issues/4673#issuecomment-771291615

### Kitty

## Tmux
Installs tpm via install script
```sh
tmux source ~/.config/tmux/.tmux.conf
# install plugins
<prefix> I - Install plugins
<prefix> U - Update plugins
```

## Neovim

You can either setup [Neovim kickstart](https://github.com/nvim-lua/kickstart.nvim) or do a custom setup for nvim

Install neovim plugins
>Note: Make sure you have `ripgrep` and `fzf` installed for telescope to work. Plugins are installed with `mason` and `packer`

### Installation
TODO - add instructions based on dotfiles

### installing neovim from source
**Install neovim from source** is by far the best way to install on *RaspberryPi* (Use debian/unbuntu installation steps)

Refer to official docs for detailed instructions
>[Build](https://github.com/neovim/neovim/blob/master/BUILD.md)
>[Install](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source)

```sh
#build pre-requisites
sudo apt install gcc
sudo apt-get install ninja-build gettext cmake unzip curl

#install
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# run nvim to see if it is running
nvim
```

### Distros
This repo allows you to install mutliple different neovim/vim distributions including a custom one

#### custom nvim
Installs custom neovim setup
```sh 
nvim
:Lazy
:Mason
```
#### kickstart nvim
Install [kickstart nvim](https://github.com/nvim-lua/kickstart.nvim), a simple neovim setup to get started
```sh
nvim # say yes to install plugins
:wq
nvim # should start installing lsp servers now
```

#### minimal vim
Install basic vim setup if you dont want neovim

#### Official Neovim Distros

Install one of lunar nvim/lazy nvim/astro nvim/nv chad/cyber nvim

TODO : *Not supported*

### Github Copilot setup
Install copilot using preferred package manager in nvim `github/copilot.vim`
save and run `:Copilot setup` it should allow you to connect with your github account now. Might not work with noice.nvim
Run `:Copilot status` to check for Tab availability. If not available remap to something else like Ctrl + e. It will then use tab when available and use Ctrl+e otherwise. To debug use these issues: [i1](https://github.com/NvChad/NvChad/issues/2020#issuecomment-1691652333), [i2](https://github.com/orgs/community/discussions/64834)

### Configuration

LSPs and mason config
> TODO: Java language server also not working - https://github.com/georgewfraser/java-language-server/issues/273 - because of company level nexus artifactory
for LSP configure with node, public npm registry along with private
for LSP configure with java (java lanuage server), update `~/.m2/settings.xml` and remove private artifactory mirror - also only works with Java 18+

LSPs/Linters to use
1. Python - Pyright

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

### Performance
Measure startup times using
```sh
nvim --startuptime startup.log -c exit && tail -100 startup.log
hyperfine "nvim --headless +qa"
hyperfine "nvim --clean --headless +qa"
:Lazy profile - more accurate than --startuptime
# measure with vscode using
code --prof-startup
```

# Custom Keybindings
Refer to [SHORTCUTS](SHORTCUTS.md)
