{ config, pkgs, ... }:

let
  inherit (import ./settings.nix) host username keyboardLayout;
in
{
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ../../system/hardware/nvidia.nix
    ../../system/hardware/bluetooth.nix
    ../../system/hardware/audio.nix
    ../../system/services/boot.nix
    ../../system/services/misc.nix
    ../../system/services/dbus.nix
    # ../../system/services/transmission.nix
    ../../system/services/gnome-keyring.nix
    ../../system/styling/stylix.nix
    ../../system/environment/wayland.nix
    ../../system/environment/hyprland.nix
  ];

  # ========== #
  # Networking #
  # ========== #
  networking.hostName = host;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;
  # ========== #

  # ======== #
  # TimeZone #
  # ======== #

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # ======== #

  # ============== #
  # X11/Xorg stuff #
  # ============== #
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = keyboardLayout;
    variant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
 
  # ============== #

  environment.shells = with pkgs; [ zsh bash ];
  # Default Shell
  users.defaultUserShell = pkgs.zsh;

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # essential system packages
    vim
    wget
    git
    pciutils # for things like lspci
    autorandr
    ripgrep
    zsh
    neofetch
    dolphin
    mplayer
    transmission
    trash-cli
    # xclip
    nurl

    # user packages
    firefox
    obsidian
    yazi
    tldr
    bat
    spotify
    yq
    jq
    nh
    fd
    glow
    # fzf
    # atuin

    # languages
    # required for neovim
    # neovide
    lazygit
    gcc
    clang
    go
    python3
    libGL
    nodejs
    rustup
    cargo
    unzip
    gnumake
    # nvm
    # python
    # pyenv

    # C related
    # gmp gmp.dev
    # isl
    # libffi libffi.dev
    # libmpc
    # libxcrypt
    # mpfr mpfr.dev
    # xz xz.dev
    # zlib zlib.dev
    # stdenv.cc
    # stdenv.cc.libc stdenv.cc.libc_dev
    # libGL
    # xorg.libX11
    # xorg.xorgproto
  ];

  system.stateVersion = "24.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
