{ homePath, pkgs, ... }:
{
  gtk = with pkgs; {
    enable = true;
    gtk3.bookmarks = [
      "trash:///${homePath}/.local/share/Trash"
      "file:///${homePath}/tum tum"
      "file:///${homePath}/drive drve"
      "file:///${homePath}/repos repos"
      "file:///${homePath}/.local local"
      "file:///${homePath}/.config config"
      "file:///${homePath}/downloads downloads"
      "file:///${homePath}/screenshots screenshots"
      "file:///${homePath}/.nix-profile nix-profile"
    ];
    # cursorTheme = {
    #   package = nordzy-cursor-theme;
    #   name = "Nordzy-white-cursors";
    #   size = 24;
    # };
    cursorTheme = {
      package = vimix-cursors;
      name = "dist-white";
      size = 24;
    };
    # iconTheme = {
    #   package = numix-icon-theme-circle;
    #   name = "Numix-Circle";
    # };
    # iconTheme = {
    #   package = kanagawa-gtk-theme;
    #   name = "Kanagawa";
    # };
    iconTheme = {
      package = vimix-icon-theme;
      name = "Vimix";
    };
    # theme = {
    #   package = nordic;
    #   name = "Nordic-darker";
    # };
    theme = {
      package = kanagawa-gtk-theme;
      name = "Kanaga-BL";
    };
    font = {
      name = "DejaVu Sans";
      size = 10;
    };
  };
}
