{ config, pkgs, ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "rg --files --hidden --follow";
    defaultOptions = [
      "--height 40%"
      "--layout=reverse"
      "--border"
      "--margin=1"
      "--padding=1"
    ];
  };
}
