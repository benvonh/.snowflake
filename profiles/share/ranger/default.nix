{ config, pkgs, sharePath, ... }:
let
  name = "ranger";
  rangerPath = sharePath name;
in
{
  home.packages = [ pkgs.ranger ];

  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink rangerPath;
    target = name;
  };
}
