{ config, ... }:
{
  xdg.dataFile = with config.lib.file; {
    audio = {
      enable = true;
      executable = false;
      recursive = true;
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/assets/audio";
      target = "audio";
    };
    wallpaper = {
      enable = true;
      executable = false;
      recursive = true;
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/assets/wallpaper";
      target = "wallpaper";
    };
  };

  xdg.configFile = with config.lib.file; {
    hypr = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/hypr";
      target = "hypr";
    };
    waybar = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/waybar";
      target = "waybar";
    };
    wofi = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/wofi";
      target = "wofi";
    };
    swaylock = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/swaylock";
      target = "swaylock";
    };
    mako = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/mako";
      target = "mako";
    };
    avizo = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/avizo";
      target = "avizo";
    };
    swayidle = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/swayidle";
      target = "swayidle";
    };
  };
}
