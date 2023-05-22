{ config, sharePath, ... }:
let
  name = "avizo";
  avizoPath = sharePath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink avizoPath;
    target = name;
  };
}
