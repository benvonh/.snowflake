{ pkgs, ... }:
{
  home.packages = [ pkgs.ranger ];

  xdg.configFile.kitty = {
    source = ../../config/kitty;
    target = "kitty";
  };
}