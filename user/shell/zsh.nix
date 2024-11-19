{ config, pkgs, host, username, ... }:
# TODO: add userSettings for dotfiles dir
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
      la = "eza -la --icons auto --group-directories-first";
      lsag = "eza -lah --icons auto --git --group-directories-first";
      lsat = "eza -lah --icons auto --git --tree -L 2 --git-ignore";
      lg = "lazygit";
      v = "nvim";
      sv = "sudo nvim";
      ".." = "cd ..";
      # rebuild = "sudo nixos-rebuild switch --flake .";
      sync = "nh os switch --hostname ${host} /home/${username}/.dotfiles";
      # update = "nix flake update";
      update = "nh os switch --hostname ${host} --update /home/${username}/.dotfiles";
      hs = "home-manager switch --flake .";
      # function for prefetch url
      pfg = "nurl $(eval pbpaste) | pbcopy";
      y = "yazi";
      jj = "pbpaste | jq . | pbcopy";
      jjn = "pbpaste | jq . | nvim - +'set syntax=json'";
      jjj = "pbpaste | jq .";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };

    initExtra = ''
      # unbinds certain emacs mode keybinds like Ctrl+P and Ctrl+N
      bindkey -v

      # Define the widget function
      function fzf-find-and-edit-widget() {
          # Preserve the current buffer contents
          local BUFFER_CONTENTS=$BUFFER
          local CURSOR_POSITION=$CURSOR

          # Clear the buffer for clean fzf display
          BUFFER=""
          zle -R

          # Run fd and fzf commands
          local selected_file=$(fd --type f --hidden --follow --exclude '{.git,node_modules,__pycache__}' | \
              fzf-tmux -p 70%,60% -- \
              --height=60% \
              --layout=reverse \
              --cycle \
              --border \
              --margin=1 \
              --padding=1 \
              --prompt='Files> ' \
              --preview='bat --line-range :500 {}' \
              --bind='ctrl-/:change-preview-window(down|hidden|)' \
              --color=header:italic \
              --header='Ctrl-/: toggle preview')

          # Restore the original buffer
          BUFFER=$BUFFER_CONTENTS
          CURSOR=$CURSOR_POSITION
          zle -R

          # If a file was selected, clear buffer and open in nvim
          if [[ -n "$selected_file" ]]; then
              # BUFFER="nvim $selected_file"
              # zle accept-line
              zle -I
              exec </dev/tty >/dev/tty 2>&1
              command nvim "$selected_file"
          fi
      }

      zle -N fzf-find-and-edit-widget
      # binds Ctrl+f
      bindkey '^f' fzf-find-and-edit-widget

      function fzf-live-grep-widget() {
          # Preserve the current buffer contents
          local BUFFER_CONTENTS=$BUFFER
          local CURSOR_POSITION=$CURSOR

          # Clear the buffer for clean fzf display
          BUFFER=""
          zle -R

          # Clean up temporary files
          rm -f /tmp/rg-fzf-{r,f}

          # Setup ripgrep command
          local RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case --glob '!{.git,node_modules,__pycache__}/*' "
          local INITIAL_QUERY=""

          # Run fzf with ripgrep integration
          local selection=$(: | fzf-tmux -p 55%,60% -- --height=60% --layout=reverse --ansi --disabled --query "$INITIAL_QUERY" \
              --bind "start:reload($RG_PREFIX {q})+unbind(ctrl-r)" \
              --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
              --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)" \
              --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($RG_PREFIX {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)" \
              --color "hl:-1:underline,hl+:-1:underline:reverse" \
              --prompt '1. ripgrep> ' \
              --delimiter : \
              --header '╱ CTRL-R (ripgrep mode) ╱ CTRL-F (fzf mode) ╱' \
              --preview 'bat --color=always {1} --highlight-line {2}' \
              --preview-window 'up,60%,border-bottom,+{2}+3/3,~3')

          # Restore the original buffer
          BUFFER=$BUFFER_CONTENTS
          CURSOR=$CURSOR_POSITION
          zle -R

          # If a selection was made, extract filename and line number and open in nvim
          if [[ -n "$selection" ]]; then
              local filename=$(echo $selection | awk -F: '{print $1}')
              local line=$(echo $selection | awk -F: '{print $2}')

              # Execute nvim directly with the line number
              zle -I
              exec </dev/tty >/dev/tty 2>&1
              command nvim $(printf "+%s %s" $line $filename) +"normal zz"
          fi
      }

      zle -N fzf-live-grep-widget
      # binds Ctrl+Shift+k
      bindkey '^k' fzf-live-grep-widget

      # binds Ctrl+y
      bindkey '^y' autosuggest-accept
      # binds Ctrl+Shift+i - doesnt work with vi mode
      # bindkey '^i' yank
    '';

    # home.packages = with pkgs; [
    #   bat eza lazygit zoxide zsh-fzf-tab fd ripgrep btop
    #   neofetch direnv nix-direnv fzf tldr
    #   # atuin
    # ];

  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  programs.eza.enable = true;
  programs.eza.enableZshIntegration = true;

  programs.yazi.enableZshIntegration = true;
}
