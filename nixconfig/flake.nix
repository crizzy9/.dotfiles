# TODO: import all settings from a file created using a gum ui bash script
{
  description = "Nightwatcher Dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    profile = "nixos-home";
    host = "nexus";
    username = "nightwatcher";
  in
  {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
        specialArgs = {
	  inherit system;
	  inherit inputs;
	  inherit profile;
	  inherit username;
	  inherit host;
	};

	modules = [
	  ./profiles/${profile}/configuration.nix
	  inputs.stylix.nixosModules.stylix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.extraSpecialArgs = {
	      inherit username;
	      inherit inputs;
	      inherit host;
	    };
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.backupFileExtension = "backup";
	    home-manager.users.${username} = import ./profiles/${profile}/home.nix;
	  }
	];
      };
    };
  };
}

