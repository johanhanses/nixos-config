{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    delta.options = {
      line-numbers = true;
#      side-by-side = true;
      navigate = true;
    };
    userName = "Johan Hanses";
    userEmail = "johanhanses@gmail.com";
    delta.enable = true;
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = false;
      };
      push = {
	autoSetupRemote = true;
	default = "current";
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
    };
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
