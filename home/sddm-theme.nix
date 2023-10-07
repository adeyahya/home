{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGithub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "7fc67d1027cdb7f4d833c5d23a8c34a0029b0661";
    sha256 = "7fc67d1027cdb7f4d833c5d23a8c34a0029b0661";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./src/* $out/
  '';
}
