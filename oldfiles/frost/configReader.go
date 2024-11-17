package main

import (
	"encoding/json"
	"fmt"
	"strings"

	"github.com/BurntSushi/toml"
)

const (
    config_file = "config.toml"
)

type general struct {
    Title string
    Version string
    Author string
    Dotfiles_dir string
    Plugins []plugin
}

type settings struct {
    // Name string
    Src string
    Dst string
    Deps []string
    Scripts []string
}

type plugin struct {
    Name string
    Items []string
    // Items []settings
    Deps []string
}

func readConfigMap(filepath string) (config map[string]interface{}) {
    config = map[string]interface{}{}
    if _, err := toml.DecodeFile(filepath, &config); err != nil {
        fmt.Println("Error while reading config file: ", err)
    }
    return config
}

func getConfig(path string) map[string]interface{} {
    config := readConfigMap(config_file)
    current := config
    for _, p := range strings.Split(path, ".") {
        current = current[p].(map[string]interface{})
    }
    return current
}

// func getConfigxx(path string) any {
//     config := readConfigMap(config_file)
//     current := config
//     splitPath := strings.Split(path, ".")
//     for i, p := range splitPath {
//         fmt.Println("i: ", i, "p: ", p)
//
//         if i == len(splitPath) - 1 && isSettings(current[p]) {
//         }
//
//         if reflect.TypeOf(current) == reflect.TypeOf(map[string]interface{}{}) {
//             current = current[p].(map[string]interface{})
//         } else {
//             return decodeSettings(current)
//         }
//     }
//     return current
// }

// func isSettings(js map[string]interface{}) bool {
//     if _, ok := js["src"]; ok {
//         return true
//     }
//     return false
// }


func decodeSettings(js map[string]interface{}) settings {
    jsonStr, err := json.Marshal(js)
    if err != nil {
        fmt.Println("Json Conversion Error: ", err)
    }
    conf := settings{}
    if err = json.Unmarshal(jsonStr, &conf); err != nil {
        fmt.Println("Error decoding plugin settings: ", err)
    }

    return conf
}

func getConfigKeys(path string) (keys []string) {
    config := getConfig(path)
    for k := range config {
        keys = append(keys, k)
    }
    return keys
}
