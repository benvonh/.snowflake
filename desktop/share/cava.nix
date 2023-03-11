{ pkgs, ... }:
{
  home.packages = [ pkgs.cava ];

  xdg.configFile.cava = {
    source = ../../config/cava;
    target = "cava";
  };
}