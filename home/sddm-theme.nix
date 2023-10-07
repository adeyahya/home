{ pkgs }:
let
  imgLink = "https://github.com/adeyahya/home/blob/main/home/assets/wall.jpg?raw=true";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "6cbe8bc29b0f0f607dbba4deb9f16105b915d1907d6a3e0c51bccb8f1aa88f62";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "7fc67d1027cdb7f4d833c5d23a8c34a0029b0661";
    sha256 = "0spqrdppyzy2c31mv77gvcl52wwqk34y8ix5gahgdizg9g4k0dja";
  };
  installPhase = ''
    mkdir -p $out
    cp -R src/catppuccin-mocha/* $out/
    cp -r ${image} $out/backgrounds/wall.jpg
    sed -i 's/CustomBackground="false"/CustomBackground="true"/g' $out/theme.conf
  '';
}
