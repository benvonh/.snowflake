{ pkgs, ... }:
{
  gtk = with pkgs; {
    enable = true;
    cursorTheme = {
      package = nordzy-cursor-theme;
      name = "Nordzy-white-cursors";
      size = 24;
    };
    iconTheme = {
      package = numix-icon-theme-circle;
      name = "Numix-Circle";
    };
    theme = {
      package = nordic;
      name = "Nordic-darker";
    };
    font = {
      name = "Noto Sans";
      size = 10;
    };
  };
}
