{ config, pkgs, ... }:
{
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
}
