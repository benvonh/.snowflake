{ pkgs, ... }:
{
  home.packages = [ pkgs.swaylock-effects ];

  xdg.configFile.swaylock = {
    source = ../../config/swaylock;
    target = "swaylock";
  };}
