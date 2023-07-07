{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Web browsers
    brave
    google-chrome
    # Video players
    mpv
    vlc
    # Discord
    discord
    # PDF editor
    libsForQt5.okular
    # GNOME applications
    gnome.nautilus
    gnome.gnome-calculator
    gnome.gnome-disk-utility
    gnome.gnome-system-monitor
  ];
}
