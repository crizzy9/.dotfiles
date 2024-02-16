package main

import (
	"fmt"
	"os"
	"path/filepath"
	"reflect"
	"strings"
)

func createSymlink(source string, target string) {
    source = resolveFilePathWithEnvVar(source)
    target = resolveFilePathWithEnvVar(target)

    fmt.Println("Creating symlink: ", source, "->", target)

    err := os.MkdirAll(filepath.Dir(target), os.ModePerm)
    if err != nil {
        fmt.Println("Error creating directory: ", err)
    }

    err = os.Symlink(source, target)
    if err != nil {
        fmt.Println("Error creating symlink: ", err)
    } else {
        fmt.Println("Symlink created successfully!")
    }
}

func resolveFilePathWithEnvVar(path string) (resolvedPath string) {
    resolvedPath = path
    t := strings.Split(path, "/")

    if strings.Contains(t[0], "$") {
        fmt.Println("Found env var: ", t[0])
        resolvedPath = filepath.Join(os.Getenv(strings.Trim(t[0], "$")), filepath.Join(t[1:]...))
    }

    return
}

func main() {
	fmt.Println("Reading config file...")

    config := readDotfilesConfig(config_file)
    fmt.Println("config: ", config)
    // fmt.Println("Title: ", config.Title)
    // fmt.Println("Version: ", config.Version)
    // fmt.Println("Globals: ", config.Globals)
    fmt.Println("Test: ", config.Test)
    // fmt.Println("Nvim: ", config.Nvim)
    // fmt.Println("Shell: ", config.Shell)

    v := reflect.ValueOf(config.Nvim)
    t := v.Type()
    fmt.Println("reflect: ", v, t)
    for i := 0; i < v.NumField(); i++ {
        fmt.Println("Field: ", t.Field(i).Name, v.Field(i).Interface())
    }

    // createSymlink(config.Test.Hello.Src, config.Test.Hello.Dst)
}

