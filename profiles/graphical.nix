{ config, pkgs, ... }:
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
    xdg-utils

    rclone
    nvtop
    neofetch
    tty-clock
    pipes-rs
    cava
  ];

  programs.kitty = {
    enable = true;
    theme = "One Half Dark";
    settings = {
      window_padding_width = 2;
      placement_strategy = "center";
    };
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 10;
    };
  };
}
