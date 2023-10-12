{ pkgs, ... }:
{
  home.packages = [
    (pkgs.callPackage ./lf-pick { inherit pkgs; })
  ];
}
