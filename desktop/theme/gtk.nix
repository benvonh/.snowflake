{ pkgs, ... }:
{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.numix-cursor-theme;
      name = "Numix-Cursor-Light";
      size = 24;
    };
    iconTheme = {
      package = pkgs.numix-icon-theme-circle;
      name = "Numix-Circle";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };
  };
}