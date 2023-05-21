{ config, commonPath, ... }:
let
  name = "swayidle";
  swayidlePath = commonPath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink swayidlePath;
    target = name;
  };
}
