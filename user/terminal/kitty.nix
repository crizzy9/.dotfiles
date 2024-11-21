{ pkgs, ... }:
{
  # xdg.configFile."kitty/kitty.conf".enable = false;

  programs.kitty = {
    enable = true;
    # theme, opacity and font configured by stylix directly, turn off to have different/none theme, prevent shell color change atleast
    # themeFile = "kanagawa";
    extraConfig = ''
      ################
      ## - Font Config
      ################
      #bold_font        	auto
      #italic_font      	auto
      #bold_italic_font 	auto
      #font_size		16

      ###########################################################
      # Symbols Nerd Font complete symbol_map
      # easily troubleshoot missing/incorrect characters with:
      #   kitty --debug-font-fallback
      ###########################################################

      # symbol_map  U+03a2-U+03bd Symbols Nerd Font

      # symbol_map  U+E000-U+E00d Symbols Nerd Font
      #
      # # "Nerd Fonts - Pomicons"
      # symbol_map  U+E000-U+E00d Symbols Nerd Font
      #
      # # "Nerd Fonts - Powerline"
      # # symbol_map U+e0a0-U+e0a3,U+e0b0-U+e0b3,U+e0c0-e0c7 Symbols Nerd Font
      # symbol_map U+e0a0-U+e0a3,U+e0b0-U+e0b3 Symbols Nerd Font
      #
      # # "Nerd Fonts - Powerline Extra"
      # symbol_map U+e0a3,U+e0b4-U+e0c8,U+e0cc-U+e0d2,U+e0d4 Symbols Nerd Font
      #
      # # "Nerd Fonts - Symbols original, Seti UI"
      # symbol_map U+e5fa-U+e62b Symbols Nerd Font
      #
      # # "Nerd Fonts - Devicons"
      # symbol_map U+e700-U+e7c5 Symbols Nerd Font
      #
      # # "Nerd Fonts - Font awesome"
      # symbol_map U+f000-U+f2e0 Symbols Nerd Font
      #
      # # "Nerd Fonts - Font awesome extension"
      # symbol_map U+e200-U+e2a9 Symbols Nerd Font
      #
      # # "Nerd Fonts - Octicons"
      # symbol_map U+f400-U+f4a8,U+2665,U+26a1,U+f27c-U+f27c Symbols Nerd Font
      #
      # # "Nerd Fonts - Font Linux, Font Logos"
      # symbol_map U+f300-U+f313 Symbols Nerd Font
      #
      # #  Nerd Fonts - Font Power Symbols, IEC Power Symbols"
      # symbol_map U+23fb-U+23fe,U+2b58 Symbols Nerd Font
      #
      # #  "Nerd Fonts - Material Design Icons"
      # symbol_map U+f500-U+fd46 Symbols Nerd Font
      #
      # # "Nerd Fonts - Weather Icons"
      # symbol_map U+e300-U+e3eb Symbols Nerd Font
      #
      # # Other symbols
      # symbol_map U+F900-U+FAFF Symbols Nerd Font
      #
      # # Misc Code Point Fixes - Messes up other fonts
      # # symbol_map U+21B5,U+25B8,U+2605,U+2630,U+2632,U+2714,U+E0A3,U+E615,U+E62B Symbols Nerd Font
      #
      # # Powerline Symbols - Narrow
      # # narrow_symbols U+E0A0-U+E0A3,U+E0C0-U+E0C7 1
    '';
  };
}
