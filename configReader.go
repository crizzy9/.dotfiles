package main

import (
    "fmt"

	"github.com/BurntSushi/toml"
)

const (
    config_file = "config.toml"
    lala_file = "lala.toml"
)

type Config struct {
    Title string
    Version string
    Globals globals
    Test test
    Nvim nvim
    Shell shell
}

type conf struct {
    Src string
    Dst string
}

type globals struct {
    Author string
    Dotfiles_dir string `toml:"DOTFILES_DIR"`
}

type test struct {
    Hello conf
}

type nvim struct {
    Custom conf
    Nvchad conf
}

type shell struct {
    Zsh conf
}

func readDotfilesConfig(filepath string) (config Config) {
    config = Config{}
    if _, err := toml.DecodeFile(filepath, &config); err != nil {
        fmt.Println("Error while reading config file: ", err)
    }
    return config
}
