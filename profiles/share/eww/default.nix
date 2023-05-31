{ config, pkgs, sharePath, ... }:
let
  name = "eww";
  ewwPath = sharePath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink ewwPath;
    target = name;
  };
}
