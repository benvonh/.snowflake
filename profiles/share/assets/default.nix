{ ... }:
{
  xdg.dataFile = {
    audio = {
      recursive = true;
      executable = false;
      source = ./audio;
      target = "audio";
    };
    wallpaper = {
      recursive = true;
      executable = false;
      source = ./wallpaper;
      target = "wallpaper";
    };
  };
}
