{ pkgs, ... }:
{
  gtk = with pkgs; {
    enable = true;
    cursorTheme = {
      package = numix-cursor-theme;
      name = "Numix-Cursor-Light";
      size = 24;
    };
    iconTheme = {
      package = numix-icon-theme-circle;
      name = "Numix-Circle";
    };
    theme = {
      package = nordic;
      name = "Nordic";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };
  };
}