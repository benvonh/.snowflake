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
      package = orchis-theme;
      name = "Orchis-Dark";
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
