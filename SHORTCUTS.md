# Shortcuts
This document describes various shortcuts and their functions across different applications that are exteremely useful. Some are default, while others are remapped in the dotfiles.

## Global shortcuts

> MacOs
```text
Ctrl + Down Arrow - Quick change for same application
Ctrl + Tab - Cycle through native tabs
Cmd + Shift + O - Open tick tick todo
Cmd + Shift + . - Show hidden files in finder
Cmd + ` - Focus other window of same app
```

## Firefox shortcuts
[link1](https://support.mozilla.org/en-US/kb/keyboard-shortcuts-perform-firefox-tasks-quickly#firefox:mac:fx118)
[link2](https://support.mozilla.org/en-US/kb/search-firefox-address-bar)
Tab Management: Simple Tab Groups

```text
about:about
Cmd + , - Preferences
Ctrl + Tab - Cycle through Tabs
Ctrl + Alt + p/n - Cycle through Tab groups
Ctrl + Shift + f - Goto custom tab group
Cmd + L - Focus address bar
Cmd + K - Focus address bar with default search engine
Alt + up/down - cycle through search engines
@b / @a in addres bar - to search with specific search engine (add more in search settings)
% in address bar - Search Tabs across all tabgroups in simple tab groups excluding archived ones
* in address bar - Search Bookmarks
^ in address bar - Search History
Ctrl + p/n - Cycle through suggestions in address bar
Cmd + [ ] - Back/Forward
Cmd + Opt + K/I - Open Devloper Console
Cmd + Opt + C - Open Devloper Console Inspector
Cmd + Opt + E - Open Devloper Console Network
```
## Tridactyl shortcuts

View keybindings with `:viewconfig` check defaults with `--default` flag
View help using `:help <subject>`
Learn Basics with `:tutor`

** Resources **
- [Readme](https://github.com/tridactyl/tridactyl#default-normal-mode-bindings)
- [Default keybindings](https://github.com/tridactyl/tridactyl/blob/master/src/lib/config.ts#L184)
- [Help Page](https://tridactyl.xyz/build/static/docs/modules/_src_excmds_.html)

By default Tridactyl will be in **Normal** mode as shown bottom right corner

Switch to **Ignore** mode using `<Shift-Esc>` to work with webpage keybindings
While in **Ignore** mode use `<C-o>` to execute a single **Normal** mode command

Go back to **Normal** mode use `<Shift-Esc>/<Esc>`
While in **Normal** mode execute a single **Ignore** mode command using `<C-v>`


### Normal Mode keybindings

| Keymap    | Action    |
|---------------- | --------------- |
| `b`    | Search and Switch to tab in current window    |
| `t`    | Search open history and bookmarks in new tab in foreground   |
| `/`    | Search in current tab |
| `d`    | Close current tab |
| `H`    | Go back a page |
| `L`    | Go forward a page |
| `J`    | Focus previous tab |
| `K`    | Focus next tab|
| `yy`    | Yank current page url to clipboard |
| `>>`/`<<`    | Move tab +1/-1 |

### Hint Mode keybindings

> More details on hints can be found using `:h hint`

| Keymap    | Action    |
|---------------- | --------------- |
| `f` hk   | open in current tab, can also be used to click buttons |
| `F` hk   | open in new tab in background |
| `;t` hk   |  open in new tab in foreground |
| `;d` hk   |  open in new tab in foreground but dont load it |
| `v` hk   | select a line - then h/j/k/l to select more and y to yank |
| `;y` hk   | yank link target if it exists |
| <Esc>/<C-[> | exit hint mode |
| Tab/S-Tab   | focus next/previous hint |
| Enter/Space | select focused hint |

## Obsidian
Cmd + Opt + I - View Source
For custom CSS - Goto Vault > .obsidian > snippets > snippet.css - then Goto Obsidian Settings > Appearance > CSS Snippets


## Tmux Shortcuts
Sessions = Traditional window type thigs
Windows = Traditional Tabs
Panes = Panes

Use shift when required to get a character
[cheatsheet1](https://tmuxcheatsheet.com/)
[cheatsheet2](https://learnxinyminutes.com/docs/tmux/)
```text
Ctrl + B - Prefix key
Alt - Meta key

-- Cli commands
tmux / tmux new - create a new session
tmux new -s <name> - create new named session
tmux neww - Open new window
tmux ls - list all sessions
tmux lsw - list all windows
tmux lsp - list all panes
tmux a/at/attach/attach-session - attach to last known session
tmux a -t <session-name> - attach to a specific session
tmux kill-session -t <session-name> - kill a specific session
tmux popup - create a popup/floating window terminal
tmux display-popup - run a shell command into a tmux popup and only persist it for that one command
tmux -f /dev/null - run tmux with default/alternate config file
tmux setw synchronize-panes - sync all panes in current window and run command in all
tmux -v - run tmux in verbose mode and store in a tmux log file for debugging

-- Sessions
<prefix> + d - detach current session
<prefix> + $ - rename session
<prefix> + s - list sessions and switch between #man tmux choose-tree, use right click on mouse to view options
<prefix> + (/) - Switch between subsequent sessions
<prefix> + L - Switch to last session

-- Windows/Tabs
<prefix> + c - New window/tab
<prefix> + , - Rename window/tab
<prefix> + & - Close current window
<prefix> + w - List windows/tabs
<prefix> + p/n | <C-p/n> - Cycle through windows/tabs
<prefix> + <num> - Activate specific tab
<prefix> + l - Activate last window/tab
<prefix> + w - Select and switch session or window from preview list

-- Panes
<prefix> + " - Horizontal split
<prefix> + % - Vertical split
<prefix> + z - zoom into a pane
<prefix> + h/j/k/l | Up/Down/Left/Right - Move to pane in direction
<prefix> + o - Cycle through panes based on their numbers
<prefix> + ; - Focus last active pane
<prefix> + q - Show pane numbers
<prefix> + q + <num> - Move to pane via number
<prefix> + ! - Convert current pane to window
<prefix> + x - Close current pane

<meta> + h/j/k/l (<prefix> + <meta> + Up/Down/Left/Right) - Resize current pane
<prefix> + E - Spread panes evenly

<prefix> + space - Cycle through default layouts
<prefix> + Ctrl + o - Rotate through pane locations
<meta> + 1/2/3/4/5 - Change pane layouts
<prefix> + {/} - Switch the current pane with left/right

-- Copy mode - Used for movement also, mouse disabled by default
<prefix> + [ - Enter copy mode and use vim motions to select
q - Exit copy mode
Enter - Copy selection
<prefix> + ] - pase contents to buffer

-- Choose Tree View
<prefix> + w/s - to bring up choose tree view
h/l - collapse/expand tree in list windows/session/pane view
Enter - enter selection
t - tag an item
C-t - tag all items
T - tag none
x - kill selected item
X - kill tagged items
m - mark item

-- Custom keybindings
<prefix> + <C-c> - Clear console
<prefix> + <C-b> - Move to last session
<prefix> + b - Move to last session - set via tmux-sensible
<prefix> + R - source tmux.conf

-- Command mode
<prefix> + : - Enter command mode
Esc + q - Exit out of commands

-- Help
<prefix> + ? / tmux list-keys - Show Keybindings
tmux info - Show basic tmux info
<prefix> + t - View current time

-- Plugins
# sessionx - session manager with preview - uninstalled - using sesh now
<prefix> e - sesssionx

# sesh - zoxide based fuzzy finder tmux session creator
# brew install joshmedeski/sesh/sesh
<C-g> - zoxide fuzzy sessionizer from sesh lookup
<C-g> <C-t> - switch to looking up existing tmux sessions from sesh lookup
## create session config scripts
## when a directory is selected if a session startup script exists run that else use the default startup script
## ignore startup script with -c command
## create a toml file in $XDG_CONFIG_HOME/sesh/sesh.toml
## add a default startupscript and path specific startup scripts
## then create a script folder with tmux commands that will get executed on startup
## more details on formatting at https://github.com/joshmedeski/sesh#configuration

# tmux fzf
## requires sed, fzf, CopyQ(clipboard), pstree(processes)
## Provides custom menu to run additional scripts from finder
<prefix> + F | <C-f> - fzf search tmux action commands

# tmux-resurrect and tmux-continuum
## sessions are stored in $XDG_DATA_HOME/tmux/resurrect/
## last file is symlinked to last session and that is what is restored by default
<prefix> + <C-s> - save session
<prefix> + <C-r> - restore last session
## uncomment the line `set -g @continuum-restore 'on'` to automatically restored last saved session on reboot

# lazygit
<prefix> + K - open lazygit in tmux popup

# tmux-nerd-font-window-name
edit `~/.config/tmux/tmux-nerd-font-window-name.yml` to update settings

# tmux yank
use vim keybindings in copy mode
<prefix> + Y - Copy current pane working directory

# vim-tmux-navigator - Works in vim as well
<C-hjkl> - Move between panes
<C-\> - Move to last pane

# catppuccin tmux
Forked repo with condaenv script
For meetings script check https://github.com/omerxx/catppuccin-tmux/commit/e30336b79986e87b1f99e6bd9ec83cffd1da2017

# harpoon

# cht.sh

# custom compiler/runner

# Disabled unused plugins
## tmux fzf-urls - can work with .txt files as well?
<prefix> + u - search urls in current tmux buffer

## tmux thumbs - quick history selector - requires cargo
<prefix> + space - open tmux thumbs
glgg <prefix>+space - select sha
a-z - quick select with numbers
<prefix> + ] - paste
```

## terminator shortcuts

```text
Ctrl + Shift + e - Vertical pane
Ctrl + Shift + o - Horizontal pane
Ctrl + Shift + n - cycle through panes
Ctrl + Shift + x - maximize active pane
Ctrl + Shift + f - search in terminal backlog
```
## Kitty shortcuts

```text
Ctrl + Shift + <F5> (Ctrl + Cmd + ,) - Reload Kitty config
Ctrl + Shift + <F6> (Alt + Cmd + ,) - Show current kitty config
Ctrl + Shift + <F2> (Cmd + ,) - Open current kitty config in editor
Cmd + Enter - Open a horizontal pane
Cmd + Enter + Ctrl + Shift + L - Open a horizontal pane then change to vertical - find a better way?
Cmd + Shift + d (Ctrl + Shift + w) - Close a window
Ctrl + Shift + ] [ - Cycle through panes
Ctrl + Shift + L - Change Layout
Cmd + t (Ctrl + Shift + t) - Open new tab
Cmd + w (Ctrl + Shift + q) - Close a tab
Cmd + Shift + ] [ (Ctrl + Shift + Left | Right) - Cycle through tabs
```

## Wezterm shortcuts

```text
Ctrl + Alt + Shift + % - Vertical pane
Ctrl + Alt + Shift + " - Horizontal pane
Ctrl + Shift + left | right - Cycle through panes
Cmd + t - New tab
Ctrl + Shift + Z - Maximize pane - TODO: show it is maximized
Ctrl + Shift + L - Open Debug pane for lua? TODO: can use this for executing current buffer?
```

## Lazygit shortcuts
TODO: learn how to do interactive reabsing, cherry-picking, bisect, worktrees
Find more keybindings [here](https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_en.md)

```text
lg - open lazygit
C-b K - open lazy git in tmux popup
a - in file menu stage unstage all
<enter> - view selected file diff in main menu
a - select hunk when in main diff menu
space - stage a line/hunk in diff menu
d - discard a line/hunk in diff menu
W - in commit menu and press enter on another diff to compare diff between commits
j/k - Move cursor up and down
h/l - Move between menus or hunks in main diff menu
Tab - switch to other pane (Stage/Unstaged) in main diff menu
g - git reset options
p - git pull current branch
P - git push to current branch
s - in file menu stash all changes
S - in file menu view stash options
space - in stash menu apply stash
g - in stash menu pop stash
d - in stash menu drop stash
n - in stash menu convert stash to new branch
/ - filter in any menu
` - toggle file tree view
c - commit changes
+ in commits - View commit graph
+ | _ - Cycle zoom in/out to current menu
< | > - Scroll to top or bottom in current menu
C-d | C-u - Scroll main panel on right
<esc> - cancel any action
z - undo last action
C-z - redo last action
: - run custom command
@ - show command log menu

# advanced functions
## ammend
a - while in commit menu to reset author for a commit
A - while in commit menu ammend staged changes to the selected commit

## cherry picking - not working properly
c - pick one or multiple commits
v - paste commit

## interactive rebasing
s - squash commit to the one below without interactive session
Press e on a commit to start an interactive rebase on it: causing all above commits to become part of the TODO file. Then squash (s), fixup (f), drop (d), edit (e), move up (ctrl+i) or move down (ctrl+j) any of TODO commits, before continuing the rebase by bringing up the rebase options menu with m and then selecting continue.

## bisect

## worktrees
```

## zsh shortcuts

> Some useful [shortcuts1](https://gist.github.com/acamino/2bc8df5e2ed0f99ddbe7a6fddb7773a6) [shortcuts2](https://github.com/scanny/dotfiles/blob/master/link/.zsh/bindkeys.zsh)
> TODO: write macro to convert keymaps into tables

### basic keybindings
| Keymap            | Action                                       |
|:------------------|:---------------------------------------------|
| `Ctrl + a`        | `Move cursor to beginning of line`           |
| `Ctrl + e`        | `Move cursor to end of line`                 |
| `Alt + b`         | `Move back one word`                         |
| `Alt + f`         | `Move forward one word`                      |
| `Ctrl + u`        | `Kill line backward`                         |
| `Ctrl + k`        | `Kill line forward`                          |
| `Ctrl + w`        | `Delete previous word`                       |
| `Ctrl + Space`    | `Accept suggestion from auto suggest`        |
| `Tab`             | `Accept first suggestion from auto complete` |

```text

# fzf based search and execute - need to source keybindings for fzf in zshrc
# OG mappings
Ctrl + t  - search files with fzf in current directory (Ctrl + o - open it in nvim)
Ctrl + r      - Search history with fzf
Alt + c       - cd to a folder with fzf
nvim/command ** <Tab> - get relevant fzf search

# Custom functions
## fzf functions
Ctrl + f - fzf nvim open a file
Alt + i - fzf nvim live grep and go to line (allows switching between ripgrep and fzf mode)
Alt + x - search a process with fzf
Ctrl + b Ctrl + f - search a process with fzf while in tmux and take action

Ctrl + p/n    - cycle through results in fzf
Esc / Ctrl + (g|c)  - cancel fzf search

## fzf syntax
| Token     | Match type                 |
| --------- | -------------------------- |
| `sbtrkt`  | fuzzy-match                |
| `'wild`   | exact-match (quoted)       |
| `^music`  | prefix-exact-match         |
| `.mp3$`   | suffix-exact-match         |
| `!fire`   | inverse-exact-match        |
| `!^music` | inverse-prefix-exact-match |
| `!.mp3$`  | inverse-suffix-exact-match |

# aliases
lss - exa ls - better ls
lsa - exa la - better ls
z <dir shortcut> - zoxide
zi - fzf search through zoxide db
jj - pretty print json from clipboard
jjj - pretty print json from clipboard and add it back to clipboard
pomo 20m work/rest - run a pomodoro timer for 20m in work or rest mode
jupyter-lab-bg - runs jupyter lab as a background task

# working with foreground and background tasks
ps aux | fzf (ps -e | fzf) (Ctrl+x+d) - fzf search current tasks
Ctrl + z - puts any current task in background
jobs - list all current background tasks
bg - run a task as a background process (alias jupyter-bg='jupyter notebook > /dev/null 2>&1 &', alias jupyter-lab-bg='jupyter-lab > /dev/null 2>&1 &')
fg %<num> - bring task to foreground
- using /dev/null 2>&1

# useful plugins/commands
w - shows list of all active terminals

# zsh plugin manager znap
znap source <plugin> - source a plugin
znap uninstall <plugin> - uninstall a plugin
znap eval <plugin> - lazy load a function

# zsh edit - check readme for more
bind -d - view duplicate keybindings
bind -u - view unused keybindings
bind -n "^[[2C" - View keymap for a keycode
cat -v - observe keycodes by typing
requires WORDCHARS = ''
Ctrl + Alt + f - forward subword in emacs mode - works with autosuggestions
Ctrl + Alt + b - backward subword in emacs mode
Ctrl + Alt + h - backward kill subword in emacs mode
Ctrl + Alt + d - backward kill subword in emacs mode

# zsh profiling
add `zmodload zsh/zprof` to the beggining of .zshrc
add `zprof` to the end of the .zshrc
then load a new terminal session or run `time zsh -i -c exit`

# zsh fast syntax highlighting
fast-theme -l - list themes for fsh
fast-theme spa - change theme

# zsh autosuggestions
Ctrl + Space - accept autosuggestion

# zsh autocomplete
Tab - Open fzf tab search on zsh autocomplete suggestions
kill Tab - Works via fzf tab
kill ** Tab - Works via fzf completion
<typesomething> Ctrl + p - Scroll back through history suggestions that go with your initital string
<typesomething> Ctrl + n - Scroll through the autocomplete suggestions
Once inside a menu list for zsh-autocomplete scroll using Ctrl + p/n or Tab

# fzf tab
Tab to start fzf-tab
gco Tab - open all checkoutable things
, . - switch groups in fzf menu
/ - trigger continuous completion

# ZLE widgets and keybindings
bindkey -L | fzf - view all existing keybindings
zle -la - show all widgets
man zshall - view full man page
man zshzle -> /reset-prompt - view builtin widgets descriptions
manually run widgets
  autoload -Uz tetris
  tetris
  M-x (Alt-x) | : (in vi mode) - write zle function name and trigger it

# other bash functions - uninstalled from zsh-autocomplete somehow - check forward-word-match
Ctrl + s - fwd-i-search search forward and jump cursor
Ctrl + r (in fwd-i-search mode to go back instead) - bck-i-search search forward and jump cursor
```

## nvim shortcuts

Leader key is mapped to `Space`
Meta key mapped to Left `Alt` in iterm2->profiles->keys->general->left option key map to Esc+
View what is mapped to what key with `:verbose imap <Tab>`

```text
# lazy nvim - plugin manager
- use lazy = true if you want to load the plugin when called using a keybinding
- event=VeryLazy / event=InsertEnter to load it at the very end or on certain events
:Lazy profile - to check startup time

# basic vim keybindings (https://neovim.io/doc/user/motion.html - for additional key bindings)
# https://gist.github.com/tuxfight3r/0dca25825d9f2608714b
u - undo
Ctrl + r - redo
s - replace character with a string. abc -> 1234bc
Ctrl + o - move backwards through the jump list
Ctrl + i - move forward to the next jump in the jumplist
Ctrl + t - move forward to next item in tag list (Works like a stack so only pops)
vt - select till - f for inclusive
vT - select back - F for inclusive
~ - Convert letter to upper case
g; - jump to last edit in file

fn + Backspace - Delete forward during normal/insert mode
:sp(:split|:hor) <file|command|terminal> - open in horizontal pane
:vsp(:vsplit|:vert) <file|command|terminal> - open in vertical pane
:tabnew <file|command|terminal> - open in new tab
gx - open a url under the cursor
gf / ]f - open file under the cursor in current window
Ctrl + w gf - open file under cursor in new tab
Ctrl + w f - open file under cursor in horizontal split
Ctrl + w v gf - open file under cursor in horizontal split

ZZ (Ctrl+ w + q) (:wq) (:x) - while in normal mode. Save and Exit
ZQ (:q!) - while in normal mode. Exit without saving

# vim motions
$ - end of line with new line char
g_ - end of line without new line char
0 - beggining of line
^ | _ - beggining of line non-blank
% - move cursor between two sets of brackets
{ } - move 5 lines above or below

# advanced vim keybindings
=ap - align (re-indent) entire paragraph
<visual select> = - align selection
<visual select> o - move to the other side of visual select
<visual select> { - select till previous empty line
<visual select> } - select till next empty line
z - show folding and other movement which-key suggestions
zz - adjust line under cursor as the middle of file
zt - adjust line under cursor as the top of file
zb - adjust line under cursor as the bottom of file
z= - spell check current word based on current spelllang
Ctrl + a - increment number
Ctrl + x - decrement number
Ctrl + r = - opens calculator while in insert mode
Ctrl + v (Vertical edit: select multiple numbers) + g + Ctrl + a - seralize all numbers(0s)
Shift + v (Line edit: select multiple lines) + g + Ctrl + a + Ctrl + a - seralize all numbers found in line

Ctrl + v - multi line cursor select. E.g (Ctrl+v j j j(place cursors) I(go to insert mode) data[0] = " Esc(exit and apply)) -> performs the same thing for all selected lines. To convert a few lines to content `abc` into `data[0]="abc"`
Shift + v (select multiple lines) :s/<motion:$>/";(your changes) - perform multiline changes via commands

# patterns in vim
<visual selection>:s/pattern/result/g

## useful patterns (:help pattern)

### pattern explaination `\<` matches the start of a word, `.` matches the first character of a word `\u` tells Vim to uppercase the following character in the substitution string (&) `&` means substitute whatever was matched on the left-hand side `g` means substitute all matches, not only the first
<visual selection>:s/\<./\u&/g - Convert first letter in each word to upper case in a selection

### do the same thing described above with Ctrl + v multi cursor select but with regex
#### \w - remove white space, .* select the rest of the stuff in there / replace with data[0] = " \1(reference what was replaced) ";
<visual selection>:s/\(\w.*\)/data[0] = "\1";

# macros
## macros and marks are stored as registers, marks to move, macros to repeat action
" - view all registers in which key
q <register: a-z> {do stuff} q - record macro
@<register> - use macro
@@ - run last ran macro
. - repeat previous action (does not repeat motion keys)
" - Check existing macros/registers
:cdo execute "norm! @a" | update - run macro on a quickfix menu after recording for @a (update saves the file)
qa <record macro> q -> "ap <paste to buffer and change macro> "ayy <update> - update existing recorded macro with new changes

# marks (used as bookmarks) - use harpoon?
## regular marks are lower case, Upper case marks are global marks
## lowercase marks (a) are for individual files, uppercase marks (A) are across files
g' or (:marks) - view all marks
' <mark> - to go back to a specific mark
' " - go back to where you last exited current buffer
' [ - start of last yank or text edit
' . - last change in current buffer
' ' - go back to where you jumped from
m <mark:a-z> - Set a new mark
:delmar! - delete all lettered marks

# jumplists
:jumps
:Telescope jumplist

# folds
zf - view folding options via which-key
za - toggle folds
zR - expand all folds
zM - close all folds

# undo tree
<leader> u - toggle undo tree for current buffer with preview
j 	jump to next undo node
gj 	jump to the parent node of the node under the cursor
k 	jump to prev undo node
J 	jump to next undo node and undo to this state
K 	jump to prev undo node and undo to this state
q 	quit undotree
p 	jump into the undotree diff window
Enter 	undo to this state

# commands for vim commandline
:norm ... - execute normal mode commands work on visual selection as well
:! cat lala.txt / :'<,'>!sort | uniq - execute terminal commands with filter mode
:X - encrypt current file with a key, unencrypt again with :X and empty key (only works in VIM)
echo $((1+2+3)) <v-select> :!zsh- execute command in zsh and echo in vim

# which-key keybindings - check general keybindings
Ctrl + w - Opens menu for other keybindings
g - Open all g related shortcuts
g? - To open keymaps within certain things like nvim tree and mason

# :help windows-intro
# Quick Window Pane and Tab movement
Ctrl + w + l - Move to right window pane
Ctrl + w + h - Move to left window pane
Ctrl + w + x - Switch splits
Ctrl + w + L(K for horizontal) - Convert from horizontal split to vertical
Ctrl + w + T - Convert chosen split into a Tab
Ctrl + w + o - Open only current window and minimize the rest
Ctrl + w + | - Maximize the current window vertically
Ctrl + w + _ - Maximize the current window horizontally
Ctrl + w + = - Eqaulize all windows back to normal
Ctrl + w + w - Cycle through window panes
gt (g<Tab>) - Next tab
gT - Previous tab
<num> gt - numbered tab
:tabmove - reorder tabs
Ctrl + z (to exit) , fg (to re-enter) - Exit to Terminal an Return to current buffer

# noice - command line
:Telescope commands - search commands via telescope and execute them
:Lsp + Tab - Use Tab to autocomplete in command line
:jumps - view all jumps
:tags - view all tags
:e - update file to latest version when updated from elsewhere
:Noice history/telescope - show messages

# git
:Git - Open Git Fugitive console
- / :Gwrite - stage highlighted/current file
u - unstage highlighted file
= - view the diff
:Gvdiff - open diff for current buffer in a vertical split
Space + h + s - Stage a hunk (a selection) from the current buffer
`[c` & `]c` - Jump between hunks in the current file?
:Git blame - git blame
Space + t b / Space + h b - toggle git blame line
Space + t d - toggle git blame delete line in current changes
:Git commit - commit
:Git commit -m "commit message" - commit with message
:Git push - push to current branch
:Git pull - pull current branch from origin
:Gvdiffsplit! - Resolve conflicts with 3 way splits <target branch://2, conflict copy, merge branch://3>
:diffget <tab a branch> - get changes into conflict copy from respective branch
:diffput <tab a branch> - push changes from branch to conflict copy

## telescope git
:Telescope git_commits - view commit histroy

# conda environments in vim using swenv and dressing
:lua require('swenv.nvim').pick_venv()
<leader>ce - Choose conda environment while in a python file. Triggers a LspRestart

# NVIM TREE
## TODO: create full side bar with git, active buffers as shown in (https://github.com/nvim-tree/nvim-tree.lua/issues/2255)
## TODO: Update to open the split next to the current window not in current window and move existing next to it
## TODO: open the same nvim tree in different tabs (https://github.com/nvim-tree/nvim-tree.lua/discussions/2244) (https://github.com/nvim-tree/nvim-tree.lua/issues/2255)
## more info on floating preview (https://github.com/nvim-tree/nvim-tree.lua/issues/135) (https://github.com/JMarkin/mynvim/blob/d733abb2ec72654211dafb089f237df9c2745758/lua/plugins/nvimtree.lua#L5) (https://github.com/JMarkin/nvim-tree.lua-float-preview)

<leader> tn (:NvimTreeToggle) - open file explorer
(:NvimTreeFindFileToggle) - Search in file explorer - TODO: Not finding file ?
Tab|Ctrl +i - open preview for a file
H I | U - show hidden and gitignore files (FIX: U shortcut not working)
a <filename> <CR> - create a new file/folder (while in nvimtree)
Ctrl + r - Rename a file in nvimtree (does not updated references with lsp) (TODO: update references, use telescope file browser maybe?, use https://github.com/nvim-tree/nvim-tree.lua/wiki/Extension-Plugins)
d - remove selected file (confirm with y)
Ctrl + k - View file size and other info
g? - To view shortcuts while in nvim tree
m - create a bookmark

# neovim terminal emulator
## more info - (https://neovim.io/doc/user/nvim_terminal_emulator.html)
## modify terminal buffers with https://www.reddit.com/r/neovim/comments/cger8p/how_quickly_close_a_terminal_buffer/
## TODO: add mapping to open existing terminal vs new terminal
(:term or :terminal) - open neovim terminal emulator in current buffer
(:tabnew | term) - open terminal in new tab
:sp term | :vsp term - open terminal/or other file in horizontal/vertical split
Ctrl + \ + Ctrl + n - Go to normal mode from terminal mode
Ctrl + \ + Ctrl + o - Go to normal mode to run a single command then back to terminal mode
Ctrl + w + q (:q / :bd!) - exit neovim terminal emulator - only from normal mode

# buffers
## :h ls - to view markers for buffers # - hidden and recently edited, %a - buffer open in current window etc
## the buffers stay open by default even after :q - use :bd to delete buffer
Space + Space - Open list of active buffers (Telescope)
:q - keep buffer open
:bd - delete current buffer
:sb <buf-num/name> - show buffer in horizontal split
:vert help ui-messages - open help or others in vertical split (different from :vsp)
:enew - create new empty buffer
:bnext / :bprev - move between buffers
:sbnext / :sbprev - open next/prev buffer in horizontal split
:vert sbnext / :vert sbprev (:vsp | bnext / :vsp | bprev) - open next/prev buffer in vertical split
Ctrl + ^ - switch between last 2 buffers

# search
/ - search forward
? - search forward
* / # - search word under cursor

# changing themes/highlighting etc
# update colorscheme in init.lua and update lualine with said colorscheme
## show tab in a different way with x? (https://github.com/nvim-tree/nvim-tree.lua/issues/2255)

# lua basics
## run lua script such as test.lua with `luajit test.lua`
print("print something") - execute and print something in lua script
:messages - to view the output of the print statements in neovim
:lua vim.lsp.buf.formatting() - to call a lua function from status line
## ways of writing key mappings
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- vim.keymap.set('n', '<leader>q', "<cmd>:Telescope diagnostics<CR>", { desc = 'Open diagnostics list' })
-- vim.keymap.set('n', '<leader>q', vim.cmd.telescope.diagnostics, { desc = 'Open diagnostics list' })
-- vim.keymap.set('n', '<leader>q', require('telescope.builtin').diagnostics, { desc = 'Open diagnostics list' })

# Other useful info and commands
`:Telescope keymaps` - search LSP keymaps
`:Mason` + i - To install a new LSP server for a language
U (when in Mason) - Update lsp servers
g? (when in Mason) - To view additional info on mason
:Lazy - Open package manager installation
K (in help man page) - Go to info about function while in :help pages

# LSP keymaps - Works if LSP installed and working and searches within workspace - how to debug?
## learn about LspAttach
## most of these only where when there is an lsp associated

## commands
:Mason - open mason
:Lspinfo - Lsp info for current project
:LspLog - Lsp logs
:LspStop /Start/Install - Other Lsp commands

## goto mappings
gr - Go to reference / Open lsp references
gd - Go to definition
gD - Go to declaration
gI - Go to implementation
gF - ?
gf - Go to file under cursor?
[d - Go to previous error (diagnostic)
]d - Go to next error (diagnostic)
Space + e - Open error in floating block
(Space + q) (+ Ctrl + q - to go quickfix) - Open list of all errors in quickfix menu ( Switched to using telescope diagnostics )
Space + q (:Telescope diagnostics) - List of all errors in telescope (REMAP)
Space + D - Type Definition (Goes into packages also)
Space + d s - Search Document Symbols
Space + w s - Search Workspace Symbols

## utility mappings
Space + r n - Rename - Be careful Also Renames references - need to do :wa
Space + c a - Code action (Such as add or organize imports and remove unused imports) TODO: these are per lsp and not working in python
Space + w l - Workspace List Folders
Space + w a - Workspace Add Folder
Space + w r - Workspace Remove Folder

## lsp suggestion/autocomplete mappings
K - hover documentation , K again to go inside the hover
ctrl + k - signature documentation

# nvim-cmp
<C-e> - Dismiss Popup
<C-p> - Go to previous suggestion
<C-n> - Go to next suggestion
<Enter> - Accept suggestion

#Copilot
Tab/<C-e> - Accept suggestion

# Snippets - luasnip
## Choose a snippet from suggestions
<C-h> - Jump to previous parameter in a snippet : ls.jump(-1)
<C-l> - Jump to next parameter in a snippet : ls.jump(1)
TODO: verify these
<C-space>|<C-j> - lua snip expand current with additional snippets (opens snippet popup) : ls.expand()
<C-h> - lua snip choice node : ls.choice_active() -> ls.change_choice(1)

# tree-sitter

## commands
`:TSUpdate` - Update added languages
`:TSInstall markdown` - Install new language support
`:TSUninstall markdown` - Uninstall new language support
`:TSInstallInfo` - Show existing installed languages, TODO: make it look like mason or show in Quickfix menu
`:TSModuleInfo` - Show module info for each filetype
`:TSBufEnable markdown` - Enable treesitter on current buffer
`:TSBufDisable markdown` - Disable treesitter on current buffer
`:Inspect` - show highlight groups under the cursor
`:InspectTree` - Toggle Treesitter parsed syntax tree
`:Edit Query` - Open Live Query Editor (Neovim 0.10+)

## basic keymaps
Ctrl + Space - incremental highlight syntactic region. word-line-block-function-class
Alt(Left Alt/Meta, mapped in iterm) + Space - decrement highlight syntactic region. word-line-block-function-class
Ctrl + s - increment highlight on scoped regions
Space + c n - Split / Condense code block using ts-node-action and treesitter

## text objects
### move to keymapings. might work to extend visual selection
]m - move to next function
[m - move to previous function
]] - move to next class
[[ - move to previous class
]s - move to next scope item
<leader>a - swap current parameter with next
<leader>A - swap current parameter with previous
p - paragraph

## visual selection bindings - start with v
v a p - visual select arund paragraph
v aa - visual select to around param - including spaces, commas and such
v ia - move visual selection to previous param
v af - move visual selection to next function
v if - move visual selection to previous function
v ac - move visual selection to next class
v ic - move visual selection to previous class
v ab - visual selection around brackets including brackets
v ib - visual selection inside brackets excluding brackets
## move entire visual selection? does that work?

## nvim surround a block of text with braces / quotes etc
### :h nvim-surround.usage
ysiw ( - surround inside word with ()
ys<select-motion: iw, aw, t, etc><surround-char> - surround general format
ds] - delete surround [abc]
cs'" - change surround from 'item' -> "item"
csth1<CR> - change html tag <b>text</b> -> <h1>text</h1>
dsf - delete function call func(abc) -> abc
ds[ - delete surrounding brackets [abc] -> abc
S" - surround a pre visual selection with given character

# mini.nvim - alignment and other things such as surround, splitjoin, jump2d

# telescope

## telescope helpful commands
:Telescope keymaps - To view all telescope keybindings - n (normal) - keymap - function - description. Follow this format when adding new keybindings to show in telescope
:Telescope help_tags - To search for help across all of neovim
Esc + Esc - exit telescope

## telescope finder
### TODO: Shorten file paths especially in java for telescope finder
### Just hit SPACE to show some suggestions on what to do
### Just hit Space + ' to simliarly view other options
Space + s + f - telescope file search
Space + s + g - telescope fuzzy search workspace
Space + s + / - telescope fuzzy search within all open files
Space + / - telescope fuzzy search within current file
Space + Space - Open list of active buffers
Space + ? - Search recently opened files
Space + s + r - Resume last search
Space + s + h - Search help (same as :Telescope help_tags)

## telescope file browser
- Open file explorer - use nvim tree
- Rename files in directory
- Add/Remove folders and files within telescope ? or use something else

## within telescope
Ctrl + p & Ctrl + n - Cycle through suggestions
Ctrl + t - Open file in new tab
Ctrl + v - Open in vertical window pane
Ctrl + x - Open in horizontal window pane
Ctrl + q - Open any telescope search in quickfix menu
Ctrl + u - erase all search text
Ctrl + a - paste last line written in insert mode into telescope search
<Esc> Ctrl + i - select multiple items in telescope in normal mode
Ctrl + h - In insert mode same as backspace

# others
# TODO: setup keybinding and save setting for setting filetype and persist value
:set filetype=lua - to manually set a filetype
```
