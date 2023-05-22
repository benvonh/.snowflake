{ config, sharePath, ... }:
let
  name = "mako";
  makoPath = sharePath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink makoPath;
    target = name;
  };
}
