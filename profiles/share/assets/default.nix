{ inputs, outputs, lib, config, pkgs, ... }:
{
  xdg.dataFile = {
    audio = {
      source = ./audio;
      target = "audio";
      recursive = false;
      executable = false;
    };
    wallpaper = {
      source = ./wallpaper;
      target = "wallpaper";
      recursive = false;
      executable = false;
    };
  };
}
