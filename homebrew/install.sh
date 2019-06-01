#!/usr/bin/env bash

source ../helpers.sh

if which brew > /dev/null; then
    echo 'HomeBrew not found... Installing'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew bundle
else
    echo 'HomeBrew already installed... Skipping'
fi
