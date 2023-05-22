{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Web browsers
    brave
    google-chrome
    tor-browser-bundle-bin
    # Video players
    mpv
    vlc
    # File manager
    pcmanfm
    # Graphical editor
    vscode
    # Image viewer
    qimgv
  ];
}
