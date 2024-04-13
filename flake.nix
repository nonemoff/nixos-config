{
  description = "NixOS config with flake and home-manager";

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      username = "matvey";
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
        pc =
          let
            hostname = "matvey-pc";
          in
          nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs username hostname pkgs; };
            modules = [
              ./hosts/pc/configuration.nix
              ./modules/os
            ];
          };
      };
      homeConfigurations = {
        "${username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit username; };
          modules = [
            ./hosts/pc/home.nix
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
