{ inputs, outputs, lib, config, pkgs, ... }:
{
  xdg.dataFile = {
    audio = {
      source = ./audio;
      target = "audio";
      recursive = true;
      executable = false;
    };
    wallpaper = {
      source = ./wallpaper;
      target = "wallpaper";
      recursive = true;
      executable = false;
    };
  };
}
