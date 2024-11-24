{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    # xwayland.enable = true;
    # nvidiaPatches = true;
  };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Invisible cursor fix
    WLR_NO_HARDWARE_CURSORS = "1";
    # allow electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  # Flavor (midnight_tress): hyprland, waybar, swaync, swww, wlogout,rofi, hyprpm, widgets, tokyodark/tokyonight
  environment.systemPackages = with pkgs; [
    dunst
    gsettings-desktop-schemas
    wlr-randr
    wtype
    # wl-clipboard
    hyprland-protocols
    # hyprpicker
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    pamixer
    # pavucontrol
    swayidle
    swaylock
    # rofi-wayland
    polkit_gnome
    libva-utils
    grimblast

    waybar
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      })
    )
    lxqt.lxqt-policykit # qt based ui for things
    hyprpicker # wayland color picker
    # swappy # snapshot editting tool
    swww # wallpaper daemon
    # rofi-wayland
    grim # grab images from wayland compositor
    slurp # select region in wayland compositor
    # swaynotificationcenter # swaync
    # dunst
    libnotify
    # meson # python build system
    # ninja # build
    # greetd.tuigreet # graphical console greeter?

    # libvirt # virtual machine
    # lm_sensors # reading harware sensors
    # v4l-utils # for some remote?ooling
    # ydotool # automation cmd tool
    # duf # disutil
    # ncdu # disk usage analyzer
    # brightnessctl
    # yad # gui for shell commands
    # inxi # cmd info tool
    # playerctl # media player cmdline
    # file-roller # archiver
    # imv # image viewer
    # mpv # media player
    # pavucontrol # pulse audio volume control
    # neovide # neovim app daemon
  ];

}
