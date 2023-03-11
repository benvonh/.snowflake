{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    pfetch
    pipes-rs
    tty-clock
    cava
  ];

  xdg.configFile = with config.lib.file; {
    neofetch = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/neofetch";
      target = "neofetch";
    };
    cava = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/cava";
      target = "cava";
    };
  };
}