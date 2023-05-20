{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ../common
    ../common/apps
    ../common/assets
    ../common/avizo
    ../common/git
    ../common/gtk
    ../common/helix
    ../common/hypr
    ../common/kitty
    ../common/lf
    ../common/mako
    ../common/neovim
    ../common/rice
    ../common/swaylock
    ../common/terminal
    ../common/waybar
    ../common/wofi
    ../common/zsh
  ];

  home = {
    username = "ben";
    homeDirectory = "/home/ben";
    stateVersion = "22.11";
  };
}
