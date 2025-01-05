{ config, ... }:
{
  programs.atuin = {
    enable = true;
    settings = {
      style = "compact";
      # invert = true;
    };
  };

  # services.atuin.enable = true;

}
