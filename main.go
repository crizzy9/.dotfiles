package main

import (
	"bufio"
	"fmt"
	"math/rand"
	"os"
	"os/exec"
	"runtime"
	"slices"
	"time"

	"github.com/charmbracelet/bubbles/progress"
	"github.com/charmbracelet/bubbles/spinner"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

type status int

const (
    downloading status = iota
    // installing
    done
    allDone
)

type model struct {
    packages []string
    index int
    width int
    height int
    step status
    progress progress.Model
    spinner spinner.Model
    done bool
}

var (
    currPackageNameStyle = lipgloss.NewStyle().Foreground(lipgloss.Color("221"))
    doneStyle            = lipgloss.NewStyle().Margin(1,2)
    checkMark            = lipgloss.NewStyle().Foreground(lipgloss.Color("42")).SetString("✔")
)

func newModel() model {
    p := progress.New(
        progress.WithDefaultGradient(),
        progress.WithWidth(40),
        progress.WithoutPercentage(),
    )
    s := spinner.New()
    s.Style = lipgloss.NewStyle().Foreground(lipgloss.Color("63"))
    return model{
        packages: getPackages(),
        spinner: s,
        progress: p,
    }
}

func getPackages() []string {
    // TODO: only install packages that have been selected
    // TODO: write a file that keeps track of installed packages including time and a log file
    pkgs := getConfigKeys("plugins")
    return pkgs
}

func (m model) Init() tea.Cmd {
    m.step = done
    return m.renderProgress()
}

func (m model) renderProgress() tea.Cmd {
    progressCmd := m.progress.SetPercent(float64(m.index) / float64(len(m.packages)-1))
    return tea.Batch(
        progressCmd,
        tea.Printf("%s %s", checkMark, m.packages[m.index]),
        downloadAndInstall(m.packages[m.index]),
    )
}

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
    switch msg := msg.(type) {
    case tea.WindowSizeMsg:
        m.width, m.height = msg.Width, msg.Height
    case tea.KeyMsg:
        switch msg.String() {
        case "ctrl+c", "esc", "q":
            return m, tea.Quit
        }
    case installedPkgMsg:
        if m.index >= len(m.packages)-1 {
            // Everything is installed, We're done
            m.done = true
            m.step = allDone
            return m, tea.Quit
        }
        m.index++
        return m, m.renderProgress()
    // case installationLogMsg:
    //     tea.Printf("Installation log: %s\n", msg)
    case spinner.TickMsg:
        var cmd tea.Cmd
        m.spinner, cmd = m.spinner.Update(msg)
        return m, cmd
    case progress.FrameMsg:
        newModel, cmd := m.progress.Update(msg)
        if newModel, ok := newModel.(progress.Model); ok {
            m.progress = newModel
        }
        return m, cmd
    }
    return m, nil
}

func (m model) View() string {
    switch m.step {
        case downloading:
            return "Downloading packages...\n"
        case done:
            n := len(m.packages)
            w := lipgloss.Width(fmt.Sprintf("%d", n))

            // if m.done {
            //     return doneStyle.Render(fmt.Sprintf("Done! Installed %d packages.\n", n))
            // }
            pkgCount := fmt.Sprintf(" %*d/%*d", w, m.index, w, n-1)

            spin := m.spinner.View() + " "
            prog := m.progress.View()
            cellsAvail := max(0, m.width-lipgloss.Width(spin+prog+pkgCount))

            pkgName := currPackageNameStyle.Render(m.packages[m.index])
            info := lipgloss.NewStyle().MaxWidth(cellsAvail).Render("Installing " + pkgName)

            // cellsRemaining := max(0, m.width-lipgloss.Width(spin+info+prog+pkgCount))
            // fmt.Println("m.width: ", m.width);
            // fmt.Println("lipgloss.Width(spin+info+prog+pkgCount): ", lipgloss.Width(spin+info+prog+pkgCount));
            // fmt.Println("cellsRemaining: ", cellsRemaining)
            // gap := strings.Repeat(" ", cellsRemaining)
            prefix := "\n"
            gap := "\n  "

            return prefix + spin + info + gap + prog + pkgCount
        case allDone:
            return doneStyle.Render(fmt.Sprintf("Done! Installed %d packages.\n", len(m.packages)))
    }
    //show progress here?
    return ""
}

type installedPkgMsg string
type installationLogMsg string

func downloadAndInstall(pkg string) tea.Cmd {
    // This is where you'd do your i/o stuff to download and install the package
    // In our case we are just pausing for a moment to simulate that
    makePlugin(pkg)
    d := time.Millisecond * time.Duration(rand.Intn(500)) //nolint:gosec
    return tea.Tick(d, func(t time.Time) tea.Msg {
        return installedPkgMsg(pkg)
    })
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}

func main() {
    if _, err := tea.NewProgram(newModel()).Run(); err != nil {
        fmt.Println("Error running program:", err)
        os.Exit(1)
    }

}

func makePlugin(plugin string) {
    installPluginDependencies(plugin)
}

func installPluginDependencies(plugin string) {
    items := getConfigKeys("plugins." + plugin)

    // install plugin level dependencies
    if slices.Contains(items, "deps") {
        loc := slices.Index(items, "deps")
        items = slices.Delete(items, loc, loc+1)
        deps := convertInterfaceToSlice(getConfig("plugins." + plugin)["deps"].([]interface{}))
        downloadDependencies(deps)
    }

    // install item level dependencies
    for _, item := range items {
        itemPath := fmt.Sprintf("plugins.%s.%s", plugin, item)
        itemSettings := decodeSettings(getConfig(itemPath))
        downloadDependencies(itemSettings.Deps)
    }
}

func downloadDependencies(deps []string) {
    // fmt.Println("Downloading dependencies...")

    var packageManager string = getPackageManager()
    if packageManager == "" {
        return
    }

    for _, dep := range deps {
        if (!doesItemExist(dep)) {
            fmt.Printf("\t%s doesn't exist, Installing...\n", dep)
            // tea.Printf("%s doesn't exist, Installing...\n", dep)

            cmd := exec.Command(packageManager, "install", dep)
            // cmd := exec.Command("yarn", "sagh")
            watchExecCommand(cmd)

        } else {
            fmt.Printf("\t%s already exists\n", dep)
            // tea.Printf("%s already exists\n", dep)
        }
    }
}

func getPackageManager() string {
    if runtime.GOOS == "darwin" {
        return "brew"
    } else if runtime.GOOS == "linux" {
        return "apt"
    } else {
        fmt.Println("Unsupported OS")
        return ""
    }
}

func watchExecCommand(cmd *exec.Cmd) {
    pipe, _ := cmd.StdoutPipe()
    cmd.Stderr = cmd.Stdout
    if err := cmd.Start(); err != nil {
        fmt.Println("Error while starting command: ", err)
    }
    reader := bufio.NewReader(pipe)
    for {
        line, err := reader.ReadString('\n')
        fmt.Printf("\t\t%s", line)
        // tea.Printf(line)
        if err != nil {
            break
        }
    }

    if err := cmd.Wait(); err != nil {
        fmt.Println("Error while executing command: ", err)
    }
}

func doesItemExist(item string) bool {
    err := exec.Command("which", item).Run()
    return err == nil
}

func convertInterfaceToSlice(a []interface{}) (b []string) {
    b = make([]string, len(a))
    for i, v := range a {
        b[i] = v.(string)
    }
    return b
}

// func makeDotfiles() {
//     fmt.Println("Making dotfiles...")
//     plugins := getConfigKeys("plugins")
//     // fmt.Println("Plugins: ", plugins)
//
//     for _, plugin := range plugins {
//         // fmt.Println("Plugin: ", plugin)
//         items := getConfigKeys("plugins." + plugin)
//         // fmt.Println("Items: ", items)
//
//         // get Plugin Dependencies
//         // TODO: move to its own struct in configReader.go
//         if slices.Contains(items, "deps") {
//             // fmt.Println("Item contains deps")
//             loc := slices.Index(items, "deps")
//             items = slices.Delete(items, loc, loc+1)
//             deps := convertInterfaceToSlice(getConfig("plugins." + plugin)["deps"].([]interface{}))
//             // fmt.Println("Plugin Deps: ", deps)
//             downloadDependencies(deps)
//         }
//
//         // iterate over items
//         for _, item := range items {
//             // fmt.Println("Item: ", item)
//             itemPath := fmt.Sprintf("plugins.%s.%s", plugin, item)
//             itemSettings := decodeSettings(getConfig(itemPath))
//             // fmt.Println("Item settings: ", itemSettings)
//             // fmt.Println("item deps: ", itemSettings.Deps)
//             downloadDependencies(itemSettings.Deps)
//         }
//     }
// }

// func dotfilesMaker() {
//     config := readDotfilesConfig(config_file)
//     fmt.Println("Title: ", config.Title)
//     fmt.Println("Version: ", config.Version)
//     fmt.Println("Test: ", config.Test)
//
//     // fmt.Println("config: ", config)
//     // fmt.Println("Globals: ", config.Globals)
//     // fmt.Println("Nvim: ", config.Nvim)
//     // fmt.Println("Shell: ", config.Shell)
//
//     // store in model.packages
//     v := reflect.ValueOf(config.Nvim)
//     t := v.Type()
//     fmt.Println("reflect: ", v, t)
//     for i := 0; i < v.NumField(); i++ {
//         fmt.Println("Field: ", t.Field(i).Name, v.Field(i).Interface())
//     }
//
//     createSymlink(config.Test.Hello.Src, config.Test.Hello.Dst)
// }

// func runPackageInstructions(pkg string) {
//     fmt.Println("Installing: ", pkg)
//     config := readDotfilesConfig(config_file)
//     fmt.Println("config: ", config)
//
//
//     v := reflect.ValueOf(config)
//     t := v.Type()
//     fmt.Println("reflect: ", v, t)
//
//     for i := 0; i < v.NumField(); i++ {
//         fmt.Println("Field: ", t.Field(i).Name, v.Field(i).Interface())
//     }
// }

// func test() {
//     dotfilesMaker()
//     runPackageInstructions("nvim")
//     fmt.Println(getConfig("plugins.nvim.custom"))
//     fmt.Println(getConfig("plugins.nvim.custom")["src"])
//     nvimCustom := getConfig("plugins.nvim.custom")
//
//     pluginSettings := decodeSettings(nvimCustom)
//     fmt.Println("pluginSettings for nvim.custom:", pluginSettings)
//     fmt.Println("nvim.custom.src", pluginSettings.Src)
//     fmt.Println("Done!")
//     fmt.Println("Installing dependencies...")
//     fmt.Println(getConfig("plugins.nvim"))
//     fmt.Println("Config keys: ", getConfigKeys("plugins"))
// }
