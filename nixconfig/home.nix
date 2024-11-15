{ config, pkgs, ... }:

let
  aliases = {
    ll = "ls -l";
    ".." = "cd ..";
    rebuild = "sudo nixos-rebuild switch --flake .";
    update = "nix flake update";
    hsync = "home-manager switch --flake .";
  };
in
{
  home.username = "nightwatcher";
  home.homeDirectory = "/home/nightwatcher";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.hello
   (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];



  # programs
  programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
  };

  home.file = {
    # "~/.config/nvim".source = ~/.dotfiles/lazyvim/.config/nvim-lazyvim;
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
