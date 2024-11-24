{ pkgs, ... }:
{
  # imports = [
  #   # ./pipewire.nix
  #   ./dbus.nix
  #   ./gnome-keyring.nix
  #   ./fonts.nix
  # ];

  environment.systemPackages = with pkgs; [
    wayland
    xwayland
    meson
    wayland-protocols
    wayland-utils
    wl-clipboard
    wlroots
    # qt5.qtwayland
    # qt6.qt6wayland
    vulkan-loader
    vulkan-validation-layers
  ];

  services.xserver = {
    enable = true;
    xkb = {
    layout = "us";
    };
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  security = {
    pam.services.swaylock = {
      text = ''
        auth include login
      '';
    };
    pam.services.login.enableGnomeKeyring = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };
}
