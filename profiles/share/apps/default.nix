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
    # GNOME applications
    gnome.nautilus
    gnome.gnome-calculator
    gnome.gnome-disk-utility
    gnome.gnome-system-monitor
  ];
}
