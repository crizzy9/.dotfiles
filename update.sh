#!/usr/bin/env bash
# author: @crizzy9
# read config.toml


get_config() {
    local file="$1"
    local toml_content=$(toml "$file")
}

