{ pkgs, ... }:
{
  home.packages = [ pkgs.waybar ];

  xdg.configFile.waybar = {
    source = ../../config/waybar;
    target = "waybar";
  };}