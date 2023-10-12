{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "lf-pick";
  src = ./src;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src/lf-pick $out/bin
    export PATH=$out/bin:$PATH
  '';
}
