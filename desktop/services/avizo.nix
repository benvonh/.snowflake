{ pkgs, ... }:
{
  home.packages = [ pkgs.avizo ];

  xdg.configFile.avizo = {
    source = ../../config/avizo;
    target = "avizo";
  };}