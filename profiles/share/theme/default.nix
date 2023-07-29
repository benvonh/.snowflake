{ inputs, outputs, lib, config, pkgs, ... }:
{
  gtk = with pkgs; {
    enable = true;
    font = {
      package = dejavu_fonts;
      name = "DejaVu Sans";
      size = 11;
    };
    theme = {
      package = gruvbox-gtk-theme;
      name = "Gruvbox-Dark-BL-LB";
    };
    iconTheme = {
      package = numix-icon-theme-circle;
      name = "Numix-Circle";
    };
    cursorTheme = {
      package = graphite-cursors;
      name = "graphite-light";
      size = 24;
    };
  };
}
