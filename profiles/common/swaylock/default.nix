{ config, commonPath, ... }:
let
  name = "swaylock";
  swaylockPath = commonPath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink swaylockPath;
    target = name;
  };
}