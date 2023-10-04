{
  description = "adeyahya NixOS Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";

    # replacement for ls
    eza.url = "github:eza-community/eza";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }@inputs:
  let
    inherit (self) outputs;
  in
  {
    nixosConfigurations = {
      os = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };
    
    homeConfigurations = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserpackages = true;
      home = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home/linux.nix
        ];
      };

      mac = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs outputs; };
        modules = with self.homeManagerModules; [
          ./home/darwin.nix
        ];
      };
    };
  };
}
