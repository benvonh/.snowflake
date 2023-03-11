{ pkgs, ... }:
{
  home.packages = [ pkgs.pcmanfm ];

  xdg.configFile.pcmanfm = {
    source = ../../config/pcmanfm;
    target = "pcmanfm";
  };
}