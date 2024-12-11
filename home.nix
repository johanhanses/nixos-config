{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/ssh.nix
    ./modules/nvim.nix
    ./modules/fzf.nix
  ];

  programs.eza.enable = true;
  
  home.username = "johanhanses";
  home.homeDirectory = "/home/johanhanses";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
