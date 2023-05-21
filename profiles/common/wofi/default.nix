{ config, commonPath, ... }:
let
  name = "wofi";
  wofiPath = commonPath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink wofiPath;
    target = name;
  };
}
