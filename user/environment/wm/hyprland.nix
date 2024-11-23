{ lib, username, host, config, pkgs, ... }:
with lib;
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # systemd.enable = true;
    # extraConfig =
    #   let
    #     modifier = "SUPER";
    #   in
    #   concatStrings [
    #     ''
    #         env = NIXOS_OZONE_WL, 1
    #         env = NIXPKGS_ALLOW_UNFREE, 1
    #         env = XDG_CURRENT_DESKTOP, Hyprland
    #         env = XDG_SESSION_TYPE, wayland
    #         env = XDG_SESSION_DESKTOP, Hyprland
    #         env = GDK_BACKEND, wayland, x11
    #         env = CLUTTER_BACKEND, wayland
    #         env = QT_QPA_PLATFORM=wayland:xcb
    #         env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
    #         env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
    #         env = SDL_VIDEODRVIER , x11
    #         env = MOZ_ENABLE_WAYLAND , x11
    #         exec-once = dbus-update-activation-environment --system --all
    #         exec-once = systemctl --user import-environment QT_QPA_PLATFORM WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    #         exec-once = killall -q swww; sleep .5 && swww init
    #         exec-once = killall -q waybar; sleep .5 && waybar
    #         exec-once = nm-applet --indicator
    #         exec-once = lxqt-policykit-agent
    #         exec-once = sleep 1.5 && swww img /home/${username}/Pictures/Wallpapers/beautifulmountainscape.jpg
    #         monitor=HDMI-A-1,2560x1440@144.91,2560x0,1
    #         monitor=HDMI-A-2,2560x144@59.95,0x0,1.25
    #         general {
    #           gaps_in = 6
    #           gaps_out = 8
    #           border_size = 2
    #           layout = dwindle
    #           resize_on_border = true
    #           col.active_border = rbg(${config.stylix.base16Scheme.base08}) rgb(${config.stylix.base16Scheme.base0C}) 45deg
    #           col.inactive_border = rgb(${config.stylix.base16Scheme.base01})
    #         }
    #         input {
    #           kb_layout = ${keyboardLayout}
    #           kb_options = grp:alt_shift_toggle
    #           kb_options = caps:super
    #           follow_mouse = 1
    #           sensitvity = 0
    #           accel_profile = flat
    #         }
    #         windowrule = noborder,^(wofi)$
    #         windowrule = center,^(wofi)$
    #         # windowrule = center,^(steam)$
    #         windowrule = float,nm-connection-editor|blueman-manager
    #         windowrule = float,swayimg|vlc|Viewnior|pavucontrol
    #         windowrule = float,nwg-look|qt5ct|mpv
    #         windowrule = float,zoom
    #         # windowrule = stayfocused, title:^()$,class:^(steam)$
    #         # windowrule = minsize, title:^()$,class:^(steam)$
    #     ''
    #   ];
  };
}
