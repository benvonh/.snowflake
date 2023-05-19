{ pkgs, ... }:
{
  home.packages = with pkgs; [
    google-chrome
    tor-browser-bundle-bin
    brave
    xfce.thunar
    vscode
    mpv
    vlc
    qimgv
  ];
}
