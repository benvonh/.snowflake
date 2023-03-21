{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    google-chrome
    tor-browser-bundle-bin
    xfce.thunar
    vscode
    mpv
    vlc
    qimgv
  ];

  programs.kitty = {
    enable = true;
    theme = "Nord";
    settings = {
      window_padding_width = 8;
      placement_strategy = "center";
    };
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 11;
    };
  };
}
