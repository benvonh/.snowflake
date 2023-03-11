{ pkgs, ... }:
{
  imports = [
    ./hypr.nix
    ./waybar.nix
  ];
  
  home.packages = [
    pkgs.xdg-utils
    pkgs.wlr-randr
    pkgs.sox
  ];
}
