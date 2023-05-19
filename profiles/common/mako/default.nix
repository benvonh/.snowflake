{ ... }:
{
  xdg.configFile.mako = {
    enable = true;
    source = ./config;
    target = "mako/config";
  };
}
