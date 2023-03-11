{ pkgs, ... }:
{
  home.packages = [ pkgs.kitty ];

  xdg.configFile.kitty = {
    source = ../../config/kitty;
    target = "kitty";
  };
}