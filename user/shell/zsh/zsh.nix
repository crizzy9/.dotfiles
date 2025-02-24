{ config, host, username, ... }:
# TODO: add userSettings for dotfiles dir
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ".." = "cd ..";
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
      la = "eza -la --icons auto --group-directories-first";
      lsag = "eza -lah --icons auto --git --group-directories-first";
      lsat = "eza -lah --icons auto --git --tree -L 2 --git-ignore";
      lg = "lazygit";
      v = "nvim";
      sv = "sudo nvim";
      sync = "nh os switch --hostname ${host} /home/${username}/.dotfiles"; # rebuild = "sudo nixos-rebuild switch --flake .";
      update = "nh os switch --hostname ${host} --update /home/${username}/.dotfiles"; # update = "nix flake update";
      hs = "home-manager switch --flake .";
      pfg = "nurl $(eval pbpaste) | pbcopy"; # function for prefetch url
      y = "yazi";
      jj = "pbpaste | jq . | pbcopy";
      jjn = "pbpaste | jq . | nvim - +'set syntax=json'";
      jjj = "pbpaste | jq .";
      gs = "git status --short";
      gd = "git diff";
      ga = "git add";
      gaa = "git add --all";
      gfa = "git fetch --all --tags --prune";
      gco = "git checkout";
      gcb = "git checkout -b";
      gcd = "git checkout -D";
      gcmsg = "git commit -m";
      gopull = "git pull origin $\{git_current_branch\}";
      gopush = "git push origin $\{git_current_branch\}";
      gprom = "git pull origin $\{git_main_branch\} --rebase --autostash";
      gprum = "git pull upstream $\{git_main_branch\} --rebase --autostash";
      glom = "git pull origin $\{git_main_branch\}";
      glum = "git pull upstream $\{git_main_branch\}";
      gluc = "git pull upstream $\{git_current_branch\}";
      glgg = "git log --graph --stat";
      glo = "git log --online -graph";
      generations = "nixos-rebuild list-generations";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    initExtra = builtins.readFile ./widgets.zsh;

  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;


  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  programs.eza.enable = true;
  programs.eza.enableZshIntegration = true;

  # TODO: how to add these separately based on shell configuration
  programs.yazi.enableZshIntegration = true;
  programs.kitty.shellIntegration.enableZshIntegration = true;
  programs.starship.enableZshIntegration = true;
  programs.atuin.enableZshIntegration = true;

}
