{ config, pkgs, ... }:
{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    nodejs_22
    neofetch
    nnn # terminal file manager
    zip
    xz
    unzip
    p7zip
    ripgrep
    eza
    fzf
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    nix-output-monitor
    glow # markdown previewer in terminal
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    cmatrix
    yazi
  ];
}
