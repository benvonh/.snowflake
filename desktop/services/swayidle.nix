{ pkgs, ... }:
{
  home.packages = [ pkgs.swayidle ];

  xdg.configFile.swayidle = {
    source = ../../config/swayidle;
    target = "swayidle";
  };}