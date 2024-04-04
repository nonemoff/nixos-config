{
  description = "NixOS config with flake and home-manager";

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      username = "nejern";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        laptop =
          let
            hostname = "Nejern-laptop";
          in
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs username hostname pkgs; };
            modules = [
              ./hosts/laptop/configuration.nix
              ./modules/os
            ];
          };
      };
      homeConfigurations = {
        "${username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/laptop/home.nix
            ./modules/home
          ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
