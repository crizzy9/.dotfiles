{ pkgs, ... }:
# let
#   current_window = let
#     name = pkgs.writeShellScript "name" ''
#
#     '';
#   in "${name}";
#
# in
{
  # xdg = {
  #   configFile."tmux/tmux.conf".source = ./tmux.conf;
  # };

  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    escapeTime = 0;
    baseIndex = 1;
    prefix = "C-Space";
    historyLimit = 500000;
    aggressiveResize = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator # TODO: remove and load directly
      yank # TODO: remove and load directly
      # sensible # TODO: remove and load directly
      cpu
      tmux-fzf
      fzf-tmux-url
      # catpuccin
      tokyo-night-tmux
      resurrect
      # "joshmedeski/tmux-nerd-font-window-name"
    ];
    extraConfig = ''
      set-option -g default-terminal "screen-256color"
      set-option -sa terminal-overrides ",xterm*:Tc"

      set -g focus-events on
      set -g status-position top
      set -g set-clipboard on
      set -g detach-on-destroy off

      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
      set-option -g display-time 4000
      set-option -g status-interval 5
      set-option -g status-keys emacs

      bind -n M-h resize-pane -L 5
      bind -n M-l resize-pane -R 5
      bind -n M-k resize-pane -U 5
      bind -n M-j resize-pane -D 5

      bind -n M-` next-layout

      bind -n M-1 select-window -t :=1
      bind -n M-2 select-window -t :=2
      bind -n M-3 select-window -t :=3
      bind -n M-4 select-window -t :=4
      bind -n M-5 select-window -t :=5

      bind -n C-[ copy-mode
      unbind-key -T copy-mode-vi MouseDragEnd1Pane
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind-key -T prefix C-c send-keys "clear" \; send-keys "Enter"

      bind-key -T prefix C-Space switch-client -l
      bind-key -T prefix Space last-window

      bind-key x kill-pane

      bind-key -T prefix v split-window -v -c "#{pane_current_path}"
      bind-key -T prefix h split-window -h -c "#{pane_current_path}"

      bind-key -T prefix K display-popup -h 80% -w 80% -E "lazygit"

      bind-key -T prefix F display-popup -h 80% -w 80% -E "yazi"

      bind-key -n "C-g" run-shell "sesh connect \"$(
        sesh list --icons | fzf-tmux -p 55%,60% \
          --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
          --header '  ^a all ^t tmux ^c configs ^x zoxide ^d tmux kill ^f find' \
          --bind 'tab:down,btab:up' \
          --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
          --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
          --bind 'ctrl-c:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
          --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
          --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
          --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)'
      )\""

      set -g @resurrect-strategy-nvim 'session'

      TMUX_FZF_LAUNCH_KEY="C-f"
    '';
    # shortcut."C-Space" = "";
  };

  home.packages = with pkgs; [
    sesh
  ];
}
