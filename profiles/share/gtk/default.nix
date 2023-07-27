{ homePath, pkgs, ... }:
{
  gtk = with pkgs; {
    enable = true;
    gtk3.bookmarks = [
      "file:///${homePath}/downloads downloads"
      "file:///${homePath}/drive drive"
      "file:///${homePath}/repos repos"
      "file:///${homePath}/.local local"
      "file:///${homePath}/.config config"
      "file:///${homePath}/screenshots screenshots"
      "file:///${homePath}/.nix-profile nix-profile"
    ];
    cursorTheme = {
      package = vimix-cursors;
      name = "dist-white";
      size = 24;
    };
    iconTheme = {
      package = numix-icon-theme-circle;
      name = "Numix-Circle";
    };
    theme = {
      package = orchis-theme;
      name = "Orchis-Dark";
    };
    font = {
      name = "DejaVu Sans";
      size = 10;
    };
  };
}
