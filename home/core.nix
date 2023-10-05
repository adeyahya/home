# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    curl
    wget
    tree
    bat
    neofetch
    starship
    lf
    duf
    eza

    # runtime
    bun

    # lsp
    lua-language-server
    nodePackages_latest.typescript-language-server
    gopls

    ripgrep
    fzf
    fd

    # compilers
    gcc
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "adeyahya";
    userEmail = "adeyahyaprasetyo@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
