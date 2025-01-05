{ pkgs, inputs, ... }:
{
  programs.hyprland = {
    enable = true;
  };

  # Flavor (midnight_tress): hyprland, waybar, swaync, swww, wlogout,rofi, hyprpm, widgets, tokyodark/tokyonight
  environment.systemPackages = with pkgs; [
    dunst
    gsettings-desktop-schemas
    wlr-randr
    wtype
    hyprland-protocols
    pamixer
    pavucontrol
    swayidle
    swaylock
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
    # hyprpaper
    hyprnome
    hypridle
    hyprlock
    # inputs.hyprlock.packages.${pkgs.system}.default
    swappy # snapshot editting tool
    swww # wallpaper daemon
    rofi-wayland
    grim # grab images from wayland compositor
    slurp # select region in wayland compositor
    swaynotificationcenter # swaync
    libnotify
    ninja # build
    cmake
    pkg-config
    cpio
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
