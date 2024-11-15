{
  description = "NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, ...}:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nexus = lib.nixosSystem {
	  inherit system;
	  modules = [
	    ./configuration.nix
	  ];
        };
      };
      homeConfigurations = {
        nightwatcher = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [
	    ./home.nix
	  ];
	};
      };
    };
}
