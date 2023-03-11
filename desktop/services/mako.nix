{ pkgs, ... }:
{
  # TODO: Use home-manager service
  home.packages = [ pkgs.mako ];

  xdg.configFile.mako = {
    source = ../../config/mako;
    target = "mako";
  };
}