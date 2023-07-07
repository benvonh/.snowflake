{ homePath, pkgs, ... }:
{
  gtk = with pkgs; {
    enable = true;
    gtk3.bookmarks = [
      "trash:///${homePath}/.local/share/Trash"
      "file:///${homePath}/downloads downloads"
      "file:///${homePath}/drive drive"
      "file:///${homePath}/repos repos"
      "file:///${homePath}/.local local"
      "file:///${homePath}/.config config"
      "file:///${homePath}/screenshots screenshots"
      "file:///${homePath}/tum tum"
      "file:///${homePath}/.nix-profile nix-profile"
    ];
    cursorTheme = {
    #   package = nordzy-cursor-theme;
    #   name = "Nordzy-white-cursors";
      package = vimix-cursors;
      name = "dist-white";
      size = 24;
    };
    iconTheme = {
    #   package = numix-icon-theme-circle;
    #   name = "Numix-Circle";
    #   package = kanagawa-gtk-theme;
    #   name = "Kanagawa";
      # package = vimix-icon-theme;
      # name = "Vimix";
      package = arc-icon-theme;
      name = "Arc";
    };
    theme = {
    #   package = nordic;
    #   name = "Nordic-darker";
      # package = kanagawa-gtk-theme;
      # name = "Kanaga-BL";
      package = arc-theme;
      name = "Arc-Darker";
    };
    font = {
      name = "DejaVu Sans";
      size = 10;
    };
  };
}
