{ pkgs, ... }:
{
  # TODO: Use home-manager service
  home.packages = [
    pkgs.mako
    pkgs.libnotify
  ];

  xdg.configFile.mako = {
    source = ../../config/mako;
    target = "mako";
  };
}