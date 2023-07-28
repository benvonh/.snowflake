{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: share "hyprland/${name}";
in
{
  xdg.configFile = with lib; {
    eww.source = mkOutOfStoreSymlink (path eww);
    wofi.source = mkOutOfStoreSymlink (path wofi);
    hypr.source = mkOutOfStoreSymlink (path hypr);
    mako.source = mkOutOfStoreSymlink (path mako);
    avizo.source = mkOutOfStoreSymlink (path avizo);
    swayidle.source = mkOutOfStoreSymlink (path swayidle);
    swaylock.source = mkOutOfStoreSymlink (path swaylock);
  };
}
