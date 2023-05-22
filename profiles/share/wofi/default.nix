{ config, sharePath, ... }:
let
  name = "wofi";
  wofiPath = sharePath name;
in
{
  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink wofiPath;
    target = name;
  };
}
