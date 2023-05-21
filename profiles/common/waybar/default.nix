{ config, commonPath, ... }:
let
  name = "waybar";
  waybarPath = commonPath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink waybarPath;
    target = name;
  };
}
