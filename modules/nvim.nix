{ config, pkgs, nixvim, ... }:
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox.enable = true;

    plugins.lualine.enable = true;
    plugins.telescope.enable = true;
  };
}
