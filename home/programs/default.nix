{ pkgs, lib, ... }:
{
  home.packages = [
    (pkgs.callPackage ./httpie.nix { inherit pkgs lib; })
    pkgs.slurp
    pkgs.grim
    pkgs.swappy
    pkgs.wf-recorder
  ];
}
