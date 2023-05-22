{ config, sharePath, ... }:
let
  name = "swaylock";
  swaylockPath = sharePath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink swaylockPath;
    target = name;
  };
}
