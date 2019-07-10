#!/usr/bin/env bash

# coz running from root dir
source ./helpers.sh

# ONLY RUN THIS FILE IF IN MACOS
# ONLY FOR MAC OS
# https://stackoverflow.com/a/17072017/4419522
# Switch to apt get if not Mac OS

# if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
# elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under 32 bits Windows NT platform
# elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Do something under 64 bits Windows NT platform
# fi

if [ "$(uname)" != "Darwin" ]; then
    info 'This is not Mac OS. Cant Install Home Brew... Skipping'
elif ! exists brew; then
    info 'HomeBrew not found... Installing'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    success 'Homebrew installation complete'
    brew bundle --global
    success 'All Brew Packages Installed!'
else
    info 'HomeBrew already installed... Skipping'
fi

# Add env paths in zshrc if needed
