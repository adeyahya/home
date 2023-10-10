{ pkgs, lib, ... }:
{
  home.packages = [
    (pkgs.callPackage ./httpie.nix { inherit pkgs lib; })
  ];
}
