{
  description = "NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # home manager
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {self, nixpkgs, ...}@inputs:
    let
      system = "x86-64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nexus = lib.nixosSystem {
	  inherit system;
	  # extraSpecialArgs = {inherit inputs;};
	  modules = [
	    ./configuration.nix
	    # inputs.home-manager.nixosModules.default
	  ];
        };
      };
    };
}
