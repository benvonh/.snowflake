{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ../common.nix
    ../hyprland.nix
    ../graphical.nix
    ../terminal.nix
    ../terminal-rice.nix
    ../gtk.nix
    ../zsh.nix
  ];

  home = {
    username = "ben";
    homeDirectory = "/home/ben";
    stateVersion = "22.11";
  };

  xdg.dataHome = /home/ben/.local;
  xdg.configHome = /home/ben/.config;
}
