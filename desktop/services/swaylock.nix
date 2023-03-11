{ pkgs, ... }:
{
  home.packages = [ pkgs.swaylock ];

  xdg.configFile.swaylock = {
    source = ../../config/swaylock;
    target = "swaylock";
  };}
