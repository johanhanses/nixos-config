{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/ssh.nix
  ];

  home.username = "johanhanses";
  home.homeDirectory = "/home/johanhanses";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
