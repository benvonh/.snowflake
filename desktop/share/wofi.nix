{ pkgs, ... }:
{
  home.packages = [ pkgs.wofi ];

  xdg.configFile.wofi = {
    source = ../../config/wofi;
    target = "wofi";
  };}