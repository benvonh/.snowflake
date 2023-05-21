{ config, commonPath, ... }:
let
  name = "mako";
  makoPath = commonPath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink makoPath;
    target = name;
  };
}
