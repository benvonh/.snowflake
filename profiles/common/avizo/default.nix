{ config, commonPath, ... }:
let
  name = "avizo";
  avizoPath = commonPath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink avizoPath;
    target = name;
  };
}
