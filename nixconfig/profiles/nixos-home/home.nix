{ config, pkgs, ... }:

let
  inherit (import ./settings.nix) username host gitUsername gitEmail;
in
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";

  imports = [
    ../../user/shell/zsh.nix
  ];

  home.packages = [
    pkgs.hello
   (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];



  # programs
  # programs.bash = {
  #   enable = true;
  #   shellAliases = aliases;
  # };
  #
  # programs.zsh = {
  #   enable = true;
  #   shellAliases = aliases;
  # };

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
