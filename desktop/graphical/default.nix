{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    brave
    pcmanfm
    vscode
    virt-manager
  ];

  programs.kitty = {
    enable = true;
    theme = "Nord";
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 11;
    };
  };
}
