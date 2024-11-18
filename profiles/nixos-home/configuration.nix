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
    ../../system/services/boot.nix
  ];

  # boot = {
  #   # Bootloader.
  #   # loader.systemd-boot.enable = true;
  #   loader.efi.canTouchEfiVariables = true;
  #   loader.grub.enable = true;
  #   loader.grub.device = "nodev";
  #   loader.grub.efiSupport = true;
  #   loader.grub.useOSProber = true;
  # };

  stylix = {
    enable = true;
    image = ../../assets/wallpapers/light/lofi-light.jpg;
    # base16scheme - tokyo night theme
    polarity = "dark";
    opacity.terminal = 0.8;
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font Mono";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };

  networking.hostName = host;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = keyboardLayout;
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    audio.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.nightwatcher = {
  #   isNormalUser = true;
  #   description = "nightwatcher";
  #   extraGroups = [ "networkmanager" "wheel" ];
  #   packages = with pkgs; [
  #     firefox
  #     obsidian
  #   #  thunderbird
  #   ];
  #   # shell = pkgs.zsh;
  # };

  # home-manager = {
  #   extraSpecialArgs = { inherit inputs;};
  #   users = {
  #     "nightwatcher" = "./home.nix"
  #   };
  # };
  environment.shells = with pkgs; [ zsh bash ];
  # Default Shell
  users.defaultUserShell = pkgs.zsh;

  # Install firefox.
  # programs.firefox.enable = true;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    # neovim
    firefox
    obsidian
    wget
    git
    pciutils # for things like lspci
    autorandr
    kitty
    ripgrep
    zsh
    neofetch
    # tmux
    yazi
    tldr
    bat
    spotify
    yq
    jq
    # lazygit
    # fzf
    # atuin

    # languages
    # required for neovim
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # bluetooth
  # hardware.bluetooth.enable = true;
  # hardware.bluetooth.powerOnBoot = true;
  # hardware.enableAllFirmware = true;
  # hardware.bluetooth = {
  #   enable = true;
  #   powerOnBoot = true;
  #   package = pkgs.bluez.overrideAttrs (finalAttrs: previousAttrs: rec {
  #     version = "5.78";
  #
  #     src = pkgs.fetchurl {
  #       url = "mirror://kernel/linux/bluetooth/bluez-${version}.tar.xz";
  #       sha256 = "sha256-gw/tGRXF03W43g9eb0X83qDcxf9f+z0x227Q8A1zxeM=";
  #     };
  #
  #     patches = [];
  #
  #     buildInputs = previousAttrs.buildInputs ++ [
  #       pkgs.python3Packages.pygments
  #     ];
  #   });
  # };
  #
  # services.blueman.enable = true; # pairing
  # systemd.services.bluetooth.serviceConfig.ConfigurationDirectoryMode = "755";
  # services.dbus.enable = true; # plugins like micp might need it


  #nvidia
#   hardware.graphics.enable = true;
#
#   # enables nvidia drivers for both xorg and wayland
#   services.xserver.videoDrivers = ["nvidia"];
#
#   # Modesetting is required.
#   hardware.nvidia.modesetting.enable = true;
#
#   # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
#   # Enable this if you have graphical corruption issues or application crashes after waking
#   # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
#   # of just the bare essentials.
#   hardware.nvidia.powerManagement.enable = true;
#
#   # Fine-grained power management. Turns off GPU when not in use.
#   # Experimental and only works on modern Nvidia GPUs (Turing or newer).
#   hardware.nvidia.powerManagement.finegrained = false;
#
#   # Use the NVidia open source kernel module (not to be confused with the
#   # independent third-party "nouveau" open source driver).
#   # Support is limited to the Turing and later architectures. Full list of 
#   # supported GPUs is at: 
#   # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
#   # Only available from driver 515.43.04+
#   # Currently alpha-quality/buggy, so false is currently the recommended setting.
#   hardware.nvidia.open = false;
#
#   # Enable the Nvidia settings menu,
#       # accessible via `nvidia-settings`.
#   hardware.nvidia.nvidiaSettings = true;
#
#   # Optionally, you may need to select the appropriate driver version for your specific GPU.
#   # package = config.boot.kernelPackages.nvidiaPackages.stable;
#   # Fix: for Nvidia 4070 Ti SUPER
#   # Special config to load the latest (535 or 550) driver for the support of the 4070 SUPER
#   hardware.nvidia.package = let
#   rcu_patch = pkgs.fetchpatch {
#     url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
#     hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
#   };
# in config.boot.kernelPackages.nvidiaPackages.mkDriver {
#     version = "535.154.05";
#     sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
#     sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
#     openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
#     settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
#     persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
#
#     #version = "550.40.07";
#     #sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
#     #sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
#     #openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
#     #settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
#     #persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";
#
#     patches = [ rcu_patch ];
#   };
}
