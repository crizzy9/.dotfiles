{ pkgs, lib, ... }:
let
  colors = {
    foreground = "#EAF2FA";
    background = "rgba(5,5,7,0.25)";
    cursor = "#EAF2FA";
    color0 = "#050507";
    color1 = "#824616";
    color2 = "#319217";
    color4 = "#5D6879";
    color5 = "#586D87";
    color6 = "#92A4B4";
    color7 = "#D8E4EF";
    color8 = "#97A0A7";
    color9 = "#AD5D1E";
    color10 = "#A96027";
    color11 = "#8D7A72";
    color12 = "#7C8BA1";
    color13 = "#7591B4";
    color14 = "#C2DAF0";
    color15 = "#D8E4EF";
  };
in
with lib;
{
  # Configure & Theme Waybar
    # T_val=$(awk "BEGIN {printf \"%.0f\", $A_1600 * 1600 * $hypr_scale / $resolution}")
    # B_val=$(awk "BEGIN {printf \"%.0f\", $B_1600 * 1600 * $hypr_scale / $resolution}")
    # echo "Setting parameters for resolution >= 2.5k and < 4k"
    # wlogout --protocol layer-shell -b 6 -T $T_val -B $B_val &
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        passthrough = false;
        spacing = 3;
        fixed-center = true;
        ipc = true;
        margin-top = 1;
        margin-left = 8;
        margin-right = 8;
        modules-center = [ "hyprland/workspaces#ss" ];
        modules-left = [
          "clock"
          "cpu"
          # "temperature"
          "memory"
          "wlr/taskbar"
        ];
        modules-right = [
          # "custom/weather"
          "hyprland/window"
          "custom/swaync"
          "mpris"
          "bluetooth"
          "network"
          "tray"
          "pulseaudio"
          "custom/power"
        ];

        "hyprland/workspaces#ss" = {
          disable-scroll = true;
          all-outputs = false;
          warp-on-scroll = false;
          sort-by-number = true;
          show-special = false;
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format = "{icon} {windows}";
          format-window-separator = " ";
          window-rewrite-default = "";
          window-rewrite = {
            "title<.*youtube.*>" = " ";
            "title<.*amazon.*>" = " ";
            "title<.*reddit.*>" = " ";
            "title<.*Picture-in-Picture.*>" = " ";
            "class<firefox>" = " ";
            "class<kitty>" = " ";
            "class<thunar>" = "󰝰 ";
            "class<discord>" = " ";
            "class<mplayer>" = " ";
            "class<code-oss>" = "󰨞 ";
            "class<codium|codium-url-handler|VSCodium>" = "󰨞 ";
            "class<libreoffice-writer>" = " ";
            "class<libreoffice-startcenter>" = "󰏆 ";
            "class<com.obsproject.Studio>" = " ";
            "class<obsidian>" = "📘";
            "class<spotify>" = " ";
          };
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";

            "11" = "一";
            "12" = "二";
            "13" = "三";
            "14" = "四";
            "15" = "五";
            "16" = "六";
            "17" = "七";
            "18" = "八";
            "19" = "九";
            "20" = "十";
          };
        };
        "hyprland/workspaces" = {
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };

        "clock" = {
          interval = 1;
          format = " {:%H:%M:%S}";
          format-alt = " {:%H:%M   %Y, %d %B, %A}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 20;
          separate-outputs = true;
          offscreen-css = true;
          offscreen-css-text = "(inactive)";
          rewrite =  {
            "(.*) — Mozilla Firefox" = " $1";
            "(.*) - zsh" = "> [$1]";
            "(.*) - kitty" = "> [$1]";
          };
        };

        "mpris" = {
          interval = 10;
          format = "{player_icon} ";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
          scroll-step = 5.0;
          # on-scroll-up = "~/.config/hypr/scripts/Volume.sh --inc";
          # on-scroll-down = "~/.config/hypr/scripts/Volume.sh --dec";
          smooth-scrolling-threshold = 1;
          player-icons = {
            chromium = "";
            default = "";
            firefox = "";
            kdeconnect = "";
            mopidy = "";
            mpv = "󰐹";
            spotify = "";
            vlc = "󰕼";
          };
          status-icons = {
            paused = "󰐎";
            playing = "";
            stopped = "";
          };
          max-length = 30;
        };

        "memory" = {
          interval = 10;
          format = "{used:0.1f}G 󰾆";
          format-alt = "{percentage}% 󰾆";
          format-alt-click = "click";
          tooltip = true;
          tooltip-format = "{used:0.1f}GB/{total:0.1f}G";
          on-click-right = "kitty --title btop sh -c 'btop'";
        };

        "cpu" = {
          format = "{usage}% 󰍛";
          interval = 1;
          min-length = 5;
          format-alt-click = "click";
          format-alt = "{icon0}{icon1}{icon2}{icon3} {usage:>2}% 󰍛";
          format-icons = [
            "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"
          ];
          on-click-right = "gnome-system-monitor";
        };

        "disk" = {
          interval = 30;
          path = "/";
          format = "{percentage_used}% 󰋊";
          tooltip-format = "{used} used out of {total} on {path} ({percentage_used}%)";
        };

        "network" = {
          format = "{ifname}";
          format-wifi = "{icon}";
          format-ethernet = "󰌘";
          format-disconnected = "󰌙";
          tooltip-format = "{ipaddr}  {bandwidthUpBits}  {bandwidthDownBits}";
          format-linked = "󰈁 {ifname} (No IP)";
          tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
          tooltip-format-ethernet = "{ifname} 󰌘";
          tooltip-format-disconnected = "󰌙 Disconnected";
          max-length = 30;
          format-icons = [
            "󰤯" "󰤟" "󰤢" "󰤥" "󰤨"
          ];
          on-click-right = "kitty nmtui";
        };

        "tray" = {
          icon-size = 18;
          spacing = 4;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} 󰂰 {volume}%";
          format-muted = "󰖁";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "󰕾"  "" ];
            ignored-sinks = [ "Easy Effects Sink" ];
          };
          scroll-step = 5.0;
          on-click = "sleep 0.1 && pavucontrol";
          # on-click = "~/.config/hypr/scripts/Volume.sh --toggle";
          on-click-right = "pavucontrol -t 3";
          # on-scroll-up = "~/.config/hypr/scripts/Volume.sh --inc";
          # on-scroll-down = "~/.config/hypr/scripts/Volume.sh --dec";
          tooltip-format = "{icon} {desc} | {volume}%";
          smooth-scrolling-threshold = 1;
        };

        "custom/power" = {
          format = "⏻ ";
          on-click = "sleep 0.1 && wlogout";
          # on-click = "~/.config/hypr/scripts/Wlogout.sh";
          # on-click-right = "~/.config/hypr/scripts/ChangeBlur.sh";
          tooltip = true;
          tooltip-format = "Left Click: Logout Menu\nRight Click: Change Blur";
        };

        # "custom/startmenu" = {
        #   format = "";
        #   tooltip = true;
        #   tooltip-format = "Left Click: Rofi Menu\nMiddle Click: Wallpaper Menu\nRight Click: Waybar Layout Menu";
        #   # on-click = "sleep 0.1 && rofi-launcher";
        #   on-click = "pkill rofi || rofi -show drun -modi run,drun,filebrowser,window";
        #   on-click-middle = "~/.config/hypr/UserScripts/WallpaperSelect.sh";
        #   on-click-right = "~/.config/hypr/scripts/WaybarLayout.sh";
        # };

        # "custom/hyprbindings" = {
        #   tooltip = false;
        #   format = "󱕴";
        #   on-click = "sleep 0.1 && list-hypr-bindings";
        # };
        #
        # "temperature" = {
        #   interval = 10;
        #   tooltip = true;
        #   hwmon-path = [
        #     /sys/class/hwmon/hwmon1/temp1_input
        #     /sys/class/thermal/thermal_zone0/temp
        #   ];
        #   critical-threshold = 82;
        #   format-critical = "{temperatureC}°C {icon}";
        #   format = "{temperatureC}°C {icon}";
        #   format-icons = [
        #     "󰈸"
        #   ];
        #   on-click-right = "kitty --title nvtop sh -c 'nvtop'";
        # };
        #
        # "custom/weather" = {
        #   format = "{}";
        #   format-alt = "{alt}: {}";
        #   format-alt-click = "click";
        #   interval = 3600;
        #   return-type = "json";
        #   exec = "~/.config/hypr/UserScripts/Weather.sh";
        #   exec-if = "ping wttr.in -c1";
        #   tooltip = true;
        # };

        "bluetooth" = {
          format = "";
          format-disabled = "󰂳";
          format-connected = "󰂱 {num_connections}";
          tooltip-format = " {device_alias}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = " {device_alias} 󰂄{device_battery_percentage}%";
          tooltip = true;
          on-click = "blueman-manager";
        };

        "wlr/taskbar" = {
          format = "{icon} {name}";
          icon-size = 16;
          all-outputs = false;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [
            "wofi"
            "rofi"
            # "kitty"
          ];
        };

        "custom/swaync" = {
          tooltip = true;
          tooltip-format = "Left Click: Launch Notification Center\nRight Click: Do not Disturb";
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

      }
    ];
    style = concatStrings [
      ''
        *{
          font-family: "JetBrainsMono Nerd Font";
          font-weight: bold;
          min-height: 0;
          /* set font-size to 100% if font scaling is set to 1.00 using nwg-look */
          font-size: 97%;
          font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
        }

        #waybar.empty, #waybar.tiled, #waybar.floating {
          background-color: transparent;
        }

        window#waybar,
        window#waybar.empty,
        window#waybar.empty #window {
          background-color: transparent;
          padding: 0px;
          border: 0px;
        }

        tooltip {
          color: ${colors.color15};
          background: ${colors.color0};
          opacity: 0.8;
          border-radius: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: ${colors.color15};
        }

        .modules-right {
          background-color: ${colors.color0};
          border: 0.5px solid ${colors.color15};
          border-radius: 10px;
          padding-top: 2px;
          padding-bottom: 2px;
          padding-right: 4px;
          padding-left: 4px;
        }
        .modules-center {
          background-color: ${colors.color0};
          border: 0.5px solid ${colors.color15};
          border-radius: 10px;
          padding-top: 2px;
          padding-bottom: 2px;
          padding-right: 4px;
          padding-left: 4px;
        }
        .modules-left {
          background-color: ${colors.color0};
          border: 0.5px solid ${colors.color15};
          border-radius: 10px;
          padding-top: 2px;
          padding-bottom: 2px;
          padding-right: 4px;
          padding-left: 4px;
        }

        #workspaces button {
          color: ${colors.color2};
          box-shadow: none;
          text-shadow: none;
          padding: 0px;
          border-radius: 9px;
          padding-left: 4px;
          padding-right: 4px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.5s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #workspaces button.active {
          color: ${colors.foreground};
          background-color: ${colors.color2};
          padding-left: 8px;
          padding-right: 8px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #workspaces button.focused {
          color: ${colors.color4};
        }

        #workspaces button.urgent {
          color: #11111b;
          border-radius: 10px;
        }

        #workspaces button:hover {
          color: ${colors.color4};
          padding-left: 2px;
          padding-right: 2px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
        }

        #backlight,
        #backlight-slider,
        #battery,
        #bluetooth,
        #clock,
        #cpu,
        #disk,
        #idle_inhibitor,
        #keyboard-state,
        #memory,
        #mode,
        #mpris,
        #network,
        #power-profiles-daemon,
        #pulseaudio,
        #pulseaudio-slider,
        #taskbar button,
        #taskbar,
        #temperature,
        #tray,
        #window,
        #wireplumber,
        #workspaces,
        #custom-backlight,
        #custom-cava_mviz,
        #custom-cycle_wall,
        #custom-hint,
        #custom-keyboard,
        #custom-light_dark,
        #custom-lock,
        #custom-menu,
        #custom-power_vertical,
        #custom-power,
        #custom-swaync,
        #custom-updater,
        #custom-weather,
        #custom-weather.clearNight,
        #custom-weather.cloudyFoggyDay,
        #custom-weather.cloudyFoggyNight,
        #custom-weather.default,
        #custom-weather.rainyDay,
        #custom-weather.rainyNight,
        #custom-weather.severe,
        #custom-weather.showyIcyDay,
        #custom-weather.snowyIcyNight,
        #custom-weather.sunnyDay {
          color: ${colors.color12};
          padding-top: 4px;
          padding-bottom: 4px;
          padding-right: 6px;
          padding-left: 6px;;
        }
        #mode {
          color: #cc3436;
          font-weight: bold
        }
        #custom-power {
          /*background-color: rgba(0,119,179,0.6);*/
          /*border-radius: 50px;*/
          padding: 1px 3px;
        }
        #idle_inhibitor.activated {
          color: #2dcc36;
        }
        #pulseaudio.muted {
          color: #cc3436;
        }
        #pulseaudio-microphone.muted {
          color: #cc3436;
        }
        #temperature.critical {
          background-color: #ff0000;
        }
        @keyframes blink {
          to {
          color: #000000;
          }
        }
        #taskbar button.active {
          color: ${colors.foreground};
          background-color: ${colors.color2};
          border-radius: 30px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
        }
        #taskbar button:hover {
          padding-left: 3px;
          padding-right: 3px;
          border-radius: 15px;
          animation: gradient_f 20s ease-in infinite;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
        }
        #battery.critical:not(.charging) {
          color: #f53c3c;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }
        #pulseaudio-slider slider {
          min-width: 0px;
          min-height: 0px;
          opacity: 0;
          background-image: none;
          border: none;
          box-shadow: none;
        }
        #pulseaudio-slider trough {
          min-width: 80px;
          min-height: 5px;
          border-radius: 5px;
        }
        #pulseaudio-slider highlight {
          min-height: 10px;
          border-radius: 5px;
        }
        #backlight-slider slider {
          min-width: 0px;
          min-height: 0px;
          opacity: 0;
          background-image: none;
          border: none;
          box-shadow: none;
        }
        #backlight-slider trough {
          min-width: 80px;
          min-height: 10px;
          border-radius: 5px;
        }
        #backlight-slider highlight {
          min-width: 10px;
          border-radius: 5px;
        }
      ''
    ];
  };
}
