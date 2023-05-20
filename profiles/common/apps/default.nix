{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brave
    mate.caja
    google-chrome
    mpv
    tor-browser-bundle-bin
    vlc
    vscode
    qimgv
  ];
}
