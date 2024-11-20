{ config, pkgs, host, username, ... }:
# TODO: add userSettings for dotfiles dir
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ".." = "cd ..";
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
      la = "eza -la --icons auto --group-directories-first";
      lsag = "eza -lah --icons auto --git --group-directories-first";
      lsat = "eza -lah --icons auto --git --tree -L 2 --git-ignore";
      lg = "lazygit";
      v = "nvim";
      sv = "sudo nvim";
      sync = "nh os switch --hostname ${host} /home/${username}/.dotfiles"; # rebuild = "sudo nixos-rebuild switch --flake .";
      update = "nh os switch --hostname ${host} --update /home/${username}/.dotfiles"; # update = "nix flake update";
      hs = "home-manager switch --flake .";
      pfg = "nurl $(eval pbpaste) | pbcopy"; # function for prefetch url
      y = "yazi";
      jj = "pbpaste | jq . | pbcopy";
      jjn = "pbpaste | jq . | nvim - +'set syntax=json'";
      jjj = "pbpaste | jq .";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    # TODO: remove and switch to starship and put git alias differently
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };

    initExtra = builtins.readFile ./widgets.zsh;

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
  programs.kitty.shellIntegration.enableZshIntegration = true;
  #
  # if test -n "$KITTY_INSTALLATION_DIR"; then
  #   export KITTY_SHELL_INTEGRATION="no-rc"
  #   autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  #   kitty-integration
  #   unfunction kitty-integration
  # fi
}
