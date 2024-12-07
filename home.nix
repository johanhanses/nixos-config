{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "johanhanses";
  home.homeDirectory = "/home/johanhanses";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neovim
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

  programs.git = {
    enable = true;
    userName = "Johan Hanses";
    userEmail = "johanhanses@gmail.com";
    delta.enable = true;
    extraConfig.init.defaultBranch = "main";
    extraConfig.pull.rebase = false;
    ignores = [
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      "Icon"
      "._*"
      ".Spotlight-V100"
      ".Trashes"
      "tags"
      "vendor-tags"
      ".ssh"
      ".lvimrc"
      ".rgignore"
      ".vscode/"
      ".idea/"
      ".fleet/"
    ];
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.zsh = {
    enable = true;

    initExtra = ''
      if [[ -o interactive ]]; then
        export SHELL=${pkgs.zsh}/bin/zsh
      fi
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      ll = "ls -la";
      l = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#";
      nv = "nvim";
      c = "clear";
      d = "docker";
      dc = "docker compose";
      gs = "git status";
      ga = "git add .";
      gcm = "git commit -m";
    };
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
