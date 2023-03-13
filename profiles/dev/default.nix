# TODO: Set up
{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ../common.nix
    ../terminal.nix
    ../terminal-rice.nix
    ../graphical.nix
    ../zsh.nix
  ];

  home = {
    username = "ben";
    homeDirectory = "/home/ben";
    stateVersion = "22.11";
  };
}
