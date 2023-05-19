{ ... }:
{
  xdg.dataFile = {
    audio = {
      enable = true;
      recursive = true;
      executable = false;
      source = ./audio;
      target = "audio";
    };
    wallpaper = {
      enable = true;
      recursive = true;
      executable = false;
      source = ./wallpaper;
      target = "wallpaper";
    };
  };
}
