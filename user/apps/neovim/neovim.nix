{ config, pkgs, ... }:
{
  xdg = {
    configFile."nvim/init.lua".enable = false;
    configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/user/apps/neovim/lazyvim";
    # desktopEntries."nvim" = lib.mkIf pkgs.stdenv.isLinux {
    #   name = "Neovim";
    #   comment = "Edit Text Files";
    #   icon = "nvim";
    #   exec = "xterm -e ${pkgs.neovim}/bin/nvim %F";
    #   categories = ["TerminalEmulator"];
    #   terminal = false;
    #   mimeType = ["text/plain"];
    # };
  };

  # home.file."~/.config/nvim".source = config.lib.file.mkOutOfStoreSymlink ./lazyvim;
  
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      lua
      lua-language-server
      gopls
      xclip
      wl-clipboard
      luajitPackages.lua-lsp
      nil
      rust-analyzer
      yaml-language-server
      bash-language-server
      typescript-language-server
      pyright
      marksman
    ];
    plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
  };
}
