{ config, pkgs, host, username, ... }:
# TODO: add userSettings for dotfiles dir
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza	--icons";
      la = "eza -la --icons auto --group-directories-first";
      lsag = "eza -lah --icons auto --git --group-directories-first";
      lsat = "eza -lah --icons auto --git --tree -L 2 --git-ignore";
      lg = "lazygit";
      v = "nvim";
      sv = "sudo nvim";
      # cat = "bat";
      ".." = "cd ..";
      # rebuild = "sudo nixos-rebuild switch --flake .";
      rebuild = "nh os switch --hostname ${host} /home/${username}/.dotfiles";
      # update = "nix flake update";
      update = "nh os switch --hostname ${host} --update /home/${username}/.dotfiles";
      hsync = "home-manager switch --flake .";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };

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
