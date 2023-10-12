{
  description = "adeyahya NixOS Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    xremap-flake.url = "github:xremap/nix-flake";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # replacement for ls
    eza.url = "github:eza-community/eza";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
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

      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./laptop.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-6th-gen
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
          ./home/desktop.nix
          ./home/linux.nix
          ./scripts
        ];
      };

      server = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home/server.nix
          ./scripts
        ];
      };

      mac = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs outputs; };
        modules = with self.homeManagerModules; [
          ./home/darwin.nix
          ./scripts
        ];
      };

      macoffice = home-manager.lib.homeManagerConfiguration {
      	pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = { inherit inputs outputs; };
        modules = with self.homeManagerModules; [
          ./home/darwin-office.nix
        ];
      };
    };
  };
}
