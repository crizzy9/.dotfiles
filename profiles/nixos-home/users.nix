{ pkgs, username, ... }:

let
  inherit (import ./settings.nix) username shell;
in
{
  users.users = {
    "${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${username}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
      ];
      shell = pkgs.${shell};
      ignoreShellProgramCheck = true;
      # packages = with pkgs; [
      # ];
    };
  };
}
