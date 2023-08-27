{ inputs, outputs, lib, config, pkgs, ... }:
{
  gtk = with pkgs; {
    enable = true;
    font = {
      name = "DejaVu Sans";
      package = dejavu_fonts;
      size = 11;
    };
    theme = {
      name = "Gruvbox-Dark-BL";
      package = gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "Numix-Circle";
      package = numix-icon-theme-circle;
    };
    cursorTheme = {
      name = "dist-white";
      package = vimix-cursors;
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
