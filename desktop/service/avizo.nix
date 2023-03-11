{ pkgs, ... }:
{
  home.packages = [
    pkgs.avizo
    pkgs.pamixer
    pkgs.brightnessctl
  ];

  xdg.configFile.avizo = {
    source = ../../config/avizo;
    target = "avizo";
  };}