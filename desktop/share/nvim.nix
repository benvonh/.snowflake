{ pkgs, ... }:
{
  home.packages = [ pkgs.neovim ];

  xdg.configFile.nvim = {
    source = ../../config/nvim;
    target = "nvim";
  };
}