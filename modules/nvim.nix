{ config, pkgs, nixvim, ... }:
{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    
    globals.mapleader = " ";

    opts = {
      number = true;
      shiftwidth = 2;
    };

    colorschemes.gruvbox.enable = true;

    plugins.lightline.enable = true;
    plugins.lualine.enable = true;
    plugins.telescope.enable = true;
    plugins.web-devicons.enable = true;
  };
}
