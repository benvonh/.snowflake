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
    # Discord
    discord
    # Code Editor
    vscode
    # GNOME applications
    gnome.nautilus
    gnome.gnome-calculator
    gnome.gnome-disk-utility
    gnome.gnome-system-monitor
  ];
}
