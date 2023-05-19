{ config, ... }:
{
  programs.zsh.profileExtra = ''
      [[ $(tty) == /dev/tty1 ]] && exec Hyprland
  '';

  xdg.dataFile = with config.lib.file; {
    audio = {
      enable = true;
      executable = false;
      recursive = true;
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/assets/audio";
      target = "audio";
    };
    wallpaper = {
      enable = true;
      executable = false;
      recursive = true;
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/assets/wallpaper";
      target = "wallpaper";
    };
  };

  xdg.configFile = with config.lib.file; {
    hypr = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/config/hypr";
      target = "hypr";
    };
    waybar = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/config/waybar";
      target = "waybar";
    };
    wofi = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/config/wofi";
      target = "wofi";
    };
    swaylock = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/config/swaylock";
      target = "swaylock";
    };
    mako = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/config/mako";
      target = "mako";
    };
    avizo = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/config/avizo";
      target = "avizo";
    };
    swayidle = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/.flakes/config/swayidle";
      target = "swayidle";
    };
  };
}
