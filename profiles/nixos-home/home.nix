{ config, pkgs, ... }:

let
  # Change it to userSettings
  inherit (import ./settings.nix) username host gitUsername gitEmail;
in
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";

  imports = [
    (import ../../user/tools/git.nix {
      inherit gitUsername;
      inherit gitEmail;
    })
    (import ../../user/shell/zsh/zsh.nix {
      inherit config;
      inherit host;
      inherit username;
    })
    ../../user/shell/starship.nix
    ../../user/apps/neovim/neovim.nix
    ../../user/apps/tmux/tmux.nix
    ../../user/apps/yazi/yazi.nix
    ../../user/terminal/kitty.nix
  ];

  home.packages = [
    pkgs.hello
    # pkgs.kitty
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  stylix.targets.kitty.enable = false;
  stylix.targets.neovim.enable = false;


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
