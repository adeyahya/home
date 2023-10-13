# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  environment,
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

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  home.file.".bashrc" = {
    source = ./bashrc;
  };
  # copy zshrc to home
  home.file.".zshrc" = {
    source = ./zshrc;
  };
  
  home.packages = with pkgs; [
    xplr
    lazygit
    helix
    nushell
    libuv
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
    nodejs_18
    bun

    # htop replacement
    # ttop

    # dashboard
    wtf

    # lsp
    lua-language-server
    nodePackages_latest.typescript-language-server
    gopls

    ripgrep
    fzf
    fd

    starship

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
