{ config, pkgs, inputs, ... }:
{
  # xdg = {
  #   configFile."hypr/hyprland.conf".enable = false;
  #   configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/user/environment/wm/hyprland";
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [
      # inputs.split-monitor-workspaces.packages.${pkgs.system}.default
      # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
      # split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];
    settings = {
      "$mainMod" = "SUPER";

      env = [
        "LIBVA_DRIVER_NAME, nvidia"
        "XDG_SESSION_TYPE, wayland"
        "GBM_BACKEND, nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME, nvidia"
        "WLR_NO_HARDWARE_CURSORS, 1" # Invisible cursor fix
        "NIXOS_OZONE_WL, 1" # allow electron apps to use wayland
        "MOZ_ENABLE_WAYLAND, 1"
      ];

      monitor = [
        "HDMI-A-2,2560x1440@144.91,0x0,1"
        "HDMI-A-1,2560x144@59.95,2560x0,1"
      ];

      general = {
        # sensitivity = 1.00;
        gaps_in = 5;
        gaps_out = 8;
        # apply_sens_to_raw = 1;
        border_size = 2;
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        # no_cursor_warps = false;
        resize_on_border = true;
      };

      exec-once = [
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "swww init"
        "waybar"
        "swaync"
        "nm-applet --indicator"
        "lxqt-policykit-agent"
        "sleep .5 && swww img ~/.dotfiles/assets/wallpapers/dark/fantasy-dark.png"
      ];

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        # special_scale_factor = 0.8;
      };

      master = {
        new_status = "master";
        # new_is_master = true;
        new_on_top = 1;
        mfact = 0.5;
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1.0;

        dim_inactive = true;
        dim_strength = 0.1;
        dim_special = 0.8;

        # drop_shadow = true;
        # shadow_range = 6;
        # shadow_render_power = 1;
        # col.shadow = "rgb(7C8BA1)";
        # col.shadow_inactive = "0x50000000";

        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          ignore_opacity = true;
          new_optimizations = true;
          special = true;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      input = {
        kb_layout = "us";
        # kb_variant =
        # kb_model =
        # kb_options =
        # kb_rules =
        repeat_rate = 50;
        repeat_delay = 300;
        numlock_by_default = true;
        left_handed = false;
        follow_mouse = true;
        float_switch_override_focus = false;

        #  touchpad {
        #    disable_while_typing = true
        #    natural_scroll = false 
        #    clickfinger_behavior = false;
        #    middle_button_emulation = true
        #    tap-to-click = true
        #    drag_lock = false
        #          }
        #
        #  # below for devices with touchdevice ie. touchscreen
        # touchdevice {
        # 	enabled = true
        # }
        #
        # # below is for table see link above for proper variables
        # tablet {
        # 	transform = 0
        # 	left_handed = 0
        # }
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 500;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = true;
      };

      # group = {
      #   "col.border_active" = "rgb(D8E4EF)";
      #   groupbar = {
      #     "col.active" = "rgb(050507)";
      #   };
      # };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
        mouse_move_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^(kitty)$";
        focus_on_activate = false;
        initial_workspace_tracking = 0;
        middle_click_paste = false;
      };

      render = {
        direct_scanout = true;
      };

      binds = {
        workspace_back_and_forth = true;
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      cursor = {
        no_hardware_cursors = true;
        enable_hyprcursor = true;
        warp_on_change_workspace = true;
      };

      bind = [
        # Basics
        "CTRL ALT, Delete, exec, hyprctl dispatch exit 0"
        # "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen"
        # "$mainMod SHIFT, Q, exec, $scriptsDir/KillActiveProcess.sh"
        "$mainMod SHIFT, F, togglefloating,"
        "$mainMod ALT, F, exec, hyprctl dispatch workspaceopt allfloat"
        # "CTRL ALT, L, exec, $scriptsDir/LockScreen.sh"
        # "CTRL ALT, P, exec, $scriptsDir/Wlogout.sh"

        # Apps
        "$mainMod, Return, exec, kitty"
        "$mainMod, E, exec, thunar"
        "$mainMod, B, exec, firefox"
        "$mainMod, Space, exec, rofi -show drun"
        "$mainMod, Q, killactive,"
        "$mainMod ALT, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo, # dwindle"
        # "$mainMod, J, togglesplit, # dwindle"


        # Master Layout
        "$mainMod CTRL, D, layoutmsg, removemaster"
        "$mainMod, I, layoutmsg, addmaster"
        "$mainMod, V, layoutmsg, cyclenext"
        "$mainMod, C, layoutmsg, cycleprev"
        "$mainMod, M, exec, hyprctl dispatch splitratio 0.3"
        "$mainMod, D, pseudo, # dwindle"
        "$mainMod CTRL, Return, layoutmsg, swapwithmaster"

        # Groups
        "$mainMod, G, togglegroup"
        "$mainMod SHIFT, tab, changegroupactive"

        # Cycle windows if floating bring to top
        "ALT,Tab,cyclenext"
        "ALT,Tab,bringactivetotop"
        "ALT SHIFT, Tab, cyclenext, prev"

        # Move windows
        # "$mainMod CTRL, J, movewindow, l"
        # "$mainMod CTRL, K, movewindow, d"
        # "$mainMod CTRL, L, movewindow, u"
        # "$mainMod CTRL, SEMICOLON, movewindow, r"
        "$mainMod CTRL, H, movewindow, l"
        "$mainMod CTRL, J, movewindow, d"
        "$mainMod CTRL, K, movewindow, u"
        "$mainMod CTRL, L, movewindow, r"

        # Move focus with mainMod + arrow keys
        # "$mainMod, J, movefocus, l"
        # "$mainMod, K, movefocus, d"
        # "$mainMod, L, movefocus, u"
        # "$mainMod, SEMICOLON, movefocus, r"
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"
        #
        # Screenshot keybindings
        # NOTE: You may need to press Fn key as well
        # "$mainMod, Print, exec, $scriptsDir/ScreenShot.sh --now"
        # "$mainMod SHIFT, Print, exec, $scriptsDir/ScreenShot.sh --area"
        # "b$mainMod CTRL, Print, exec, $scriptsDir/ScreenShot.sh --in5"
        # "b$mainMod CTRL SHIFT, Print, exec, $scriptsDir/ScreenShot.sh --in10"
        # "ALT, Print, exec, $scriptsDir/ScreenShot.sh --active"

        # screenshot with swappy (another screenshot tool)
        # "$mainMod SHIFT, S, exec, $scriptsDir/ScreenShot.sh --swappy"

        # FEATURES / EXTRAS
        # "$mainMod, F2, exec, $scriptsDir/KeyHints.sh # Small help file"
        # "$mainMod ALT, R, exec, $scriptsDir/Refresh.sh # Refresh waybar, swaync, rofi"
        # "$mainMod ALT, E, exec, $scriptsDir/RofiEmoji.sh # emoji"
        # "$mainMod, S, exec, $scriptsDir/RofiSearch.sh # Google search from Rofi"
        # "$mainMod SHIFT, B, exec, $scriptsDir/ChangeBlur.sh # Toggle blur settings" 
        # "$mainMod SHIFT, G, exec, $scriptsDir/GameMode.sh # animations ON/OFF"
        # "$mainMod ALT, L, exec, $scriptsDir/ChangeLayout.sh # Toggle Master or Dwindle Layout"
        # "$mainMod ALT, V, exec, $scriptsDir/ClipManager.sh # Clipboard Manager"
        # "$mainMod SHIFT, N, exec, swaync-client -t -sw # swayNC panel"

        # FEATURES / EXTRAS (UserScripts)
        # "$mainMod, E, exec, $UserScripts/QuickEdit.sh # Quick Edit Hyprland Settings"
        # "$mainMod SHIFT, M, exec, $UserScripts/RofiBeats.sh # online music"
        # "$mainMod, W, exec, $UserScripts/WallpaperSelect.sh # Select wallpaper to apply"
        # "$mainMod SHIFT, W, exec, $UserScripts/WallpaperEffects.sh # Wallpaper Effects by imagemagickWW"
        # "CTRL ALT, W, exec, $UserScripts/WallpaperRandom.sh # Random wallpapers"

        # Waybar / Bar related
        # "$mainMod, B, exec, killall -SIGUSR1 waybar # Toggle hide/show waybar" 
        # "$mainMod CTRL, B, exec, $scriptsDir/WaybarStyles.sh # Waybar Styles Menu"
        # "$mainMod ALT, B, exec, $scriptsDir/WaybarLayout.sh # Waybar Layout Menu"
        # "CTRL SHIFT, B, exec, $scriptsDir/WaybarRestart.sh # Restart Waybar"


        # Workspaces related
        # bind = $mainMod, Tab, workspace, m+1
        # bind = $mainMod SHIFT, tab, workspace, m-1
        "$mainMod, Tab, split-workspace, previous"
        # bind = $mainMod, Tab, workspace, previous

        # Special workspace
        "$mainMod SHIFT, U, movetoworkspace, special"
        "$mainMod, U, togglespecialworkspace,"
        # move back to main workspace

        "$mainMod, 1, split-workspace, 1"
        "$mainMod, 2, split-workspace, 2"
        "$mainMod, 3, split-workspace, 3"
        "$mainMod, 4, split-workspace, 4"
        "$mainMod, 5, split-workspace, 5"
        "$mainMod, 6, split-workspace, 6"
        "$mainMod, 7, split-workspace, 7"
        "$mainMod, 8, split-workspace, 8"
        "$mainMod, 9, split-workspace, 9"
        "$mainMod, 0, split-workspace, 10"
        "$mainMod, bracketleft, workspace, -1"
        "$mainMod, bracketright, workspace, +1"

        "$mainMod SHIFT, 1, split-movetoworkspace, 1"
        "$mainMod SHIFT, 2, split-movetoworkspace, 2"
        "$mainMod SHIFT, 3, split-movetoworkspace, 3"
        "$mainMod SHIFT, 4, split-movetoworkspace, 4"
        "$mainMod SHIFT, 5, split-movetoworkspace, 5"
        "$mainMod SHIFT, 6, split-movetoworkspace, 6"
        "$mainMod SHIFT, 7, split-movetoworkspace, 7"
        "$mainMod SHIFT, 8, split-movetoworkspace, 8"
        "$mainMod SHIFT, 9, split-movetoworkspace, 9"
        "$mainMod SHIFT, 0, split-movetoworkspace, 10"
        "$mainMod SHIFT, bracketleft, movetoworkspace, -1"
        "$mainMod SHIFT, bracketright, movetoworkspace, +1"

        "$mainMod CTRL, 1, split-movetoworkspacesilent, 1"
        "$mainMod CTRL, 2, split-movetoworkspacesilent, 2"
        "$mainMod CTRL, 3, split-movetoworkspacesilent, 3"
        "$mainMod CTRL, 4, split-movetoworkspacesilent, 4"
        "$mainMod CTRL, 5, split-movetoworkspacesilent, 5"
        "$mainMod CTRL, 6, split-movetoworkspacesilent, 6"
        "$mainMod CTRL, 7, split-movetoworkspacesilent, 7"
        "$mainMod CTRL, 8, split-movetoworkspacesilent, 8"
        "$mainMod CTRL, 9, split-movetoworkspacesilent, 9"
        "$mainMod CTRL, 0, split-movetoworkspacesilent, 10"
        "$mainMod CTRL, bracketleft, movetoworkspacesilent, -1"
        "$mainMod CTRL, bracketright, movetoworkspacesilent, +1"

        # Scroll through existing workspaces with mainMod + scroll or mainMod + N/P
        "$mainMod, mouse_down, split-cycleworkspaces, next"
        "$mainMod, mouse_up, split-cycleworkspaces, prev"
        "$mainMod, N, split-cycleworkspaces, next"
        "$mainMod, P, split-cycleworkspaces, prev"

        # move window to another monitor
        "$mainMod ALT, bracketright, split-changemonitor, next"
        "$mainMod ALT, bracketleft, split-changemonitor, prev"

        # move between monitors
        "$mainMod, Right, focusmonitor, +1"
        "$mainMod, Left, focusmonitor, -1"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      binde = [
        # Resize windows
        # "$mainMod SHIFT, J, resizeactive,-50 0"
        # "$mainMod SHIFT, K, resizeactive,0 50"
        # "$mainMod SHIFT, L, resizeactive,0 -50"
        # "$mainMod SHIFT, SEMICOLON, resizeactive,50 0"
        "$mainMod SHIFT, H, resizeactive,-50 0"
        "$mainMod SHIFT, J, resizeactive,0 50"
        "$mainMod SHIFT, K, resizeactive,0 -50"
        "$mainMod SHIFT, L, resizeactive,50 0"
      ];
      # bindl = [
      #   # media controls using keyboards
      #   ", xf86AudioPlayPause, exec, $scriptsDir/MediaCtrl.sh --pause"
      #   ", xf86AudioPause, exec, $scriptsDir/MediaCtrl.sh --pause"
      #   ", xf86AudioPlay, exec, $scriptsDir/MediaCtrl.sh --pause"
      #   ", xf86AudioNext, exec, $scriptsDir/MediaCtrl.sh --nxt"
      #   ", xf86AudioPrev, exec, $scriptsDir/MediaCtrl.sh --prv"
      #   ", xf86audiostop, exec, $scriptsDir/MediaCtrl.sh --stop"
      #   ", xf86AudioMicMute, exec, $scriptsDir/Volume.sh --toggle-mic #mute mic"
      #   ", xf86audiomute, exec, $scriptsDir/Volume.sh --toggle"
      #   ", xf86Sleep, exec, systemctl suspend  # sleep button" 
      #   ", xf86Rfkill, exec, $scriptsDir/AirplaneMode.sh #Airplane mode"
      # ];
      # bindel = [
      #   # Special Keys / Hot Keys
      #   ", xf86audioraisevolume, exec, $scriptsDir/Volume.sh --inc #volume up"
      #   ", xf86audiolowervolume, exec, $scriptsDir/Volume.sh --dec #volume down"
      # ];

      # windowrule = [
      # ];
    };

    # extraConfig = ''
    #   exec-once=${split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces}/lib/lisplit-monitor-workspaces.so
    #   plugin {
    #     split-monitor-workspaces {
    #       count = 10
    #       keep_focused = true
    #       debug_log = true
    #     }
    #   }
    # '';

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
