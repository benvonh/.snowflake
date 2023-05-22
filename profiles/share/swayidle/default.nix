{ config, sharePath, ... }:
let
  name = "swayidle";
  swayidlePath = sharePath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink swayidlePath;
    target = name;
  };
}
