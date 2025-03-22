# TODO: import all settings from a file created using a gum ui bash script
{
  description = "Nightwatcher Dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland"; # <- make sure this line is present for the plugin to work as intended
    };
    # Hyprspace = {
    #   url = "github:KZDKM/Hyprspace";
    #   inputs.hyprland.follows = "hyprland";
    # };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  # update this to match with librephenoix format
  let
    system = "x86_64-linux";
    profile = "nixos-home";
    host = "nexus";
    username = "nightwatcher";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit system;
          inherit profile;
          inherit username;
          inherit host;
        };

        modules = [
          ./profiles/${profile}/configuration.nix
          inputs.stylix.nixosModules.stylix
          # inputs.hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              inherit username;
              inherit inputs;
              inherit host;
              inherit pkgs;
              # inherit (inputs) split-monitor-workspaces;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username}.imports = [
              ./profiles/${profile}/home.nix
              inputs.hyprland.homeManagerModules.default
            ];
          }
        ];
      };
    };
  };
}

