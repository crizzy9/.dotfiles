#!/usr/bin/env bash

source ../helpers.sh

if which brew > /dev/null; then
    info 'HomeBrew not found... Installing'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    success 'Homebrew installation complete'
    brew bundle
    success 'All Brew Packages Installed!'
else
    info 'HomeBrew already installed... Skipping'
fi
