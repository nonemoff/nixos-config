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
            specialArgs = { inherit inputs username hostname; };
            modules = [
              ./configuration.nix
            ];
          };
      };
      homeConfigurations = {
        "${username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager/home.nix ];
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
