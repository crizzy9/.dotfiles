package main

import (
    "fmt"
	"os"
	"path/filepath"
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

    if _, err := os.Lstat(target); err == nil {
        sr, _ := os.Readlink(target)
        if sr != source {
            os.Remove(target)
        } else {
            fmt.Println("[SKIP] Symlink already exists!")
            return
        }
    }

    err = os.Symlink(source, target)
    if err != nil {
        fmt.Println("Error creating symlink: ", err)
    } else {
        fmt.Println("Symlink created successfully!")
    }
}

func resolveFilePathWithEnvVar(path string) (resolvedPath string) {
    switch t := strings.Split(path, "/"); path[0] {
    case '$':
        fmt.Println("Resolving environment variable: ", t[0])
        resolvedPath = filepath.Join(os.Getenv(strings.Trim(t[0], "$")), filepath.Join(t[1:]...))
    case '~':
        resolvedPath = filepath.Join(os.Getenv("HOME"), filepath.Join(t[1:]...))
    case '/':
        resolvedPath = path
    default:
        wd, _ := os.Getwd()
        resolvedPath = filepath.Join(wd, strings.Trim(path, "./"))
    }

    return
}
