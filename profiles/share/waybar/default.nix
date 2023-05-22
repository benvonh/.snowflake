{ config, sharePath, ... }:
let
  name = "waybar";
  waybarPath = sharePath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink waybarPath;
    target = name;
  };
}
