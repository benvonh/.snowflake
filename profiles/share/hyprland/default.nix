{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: share "hyprland/${name}";
  wrap = name: config.lib.file.mkOutOfStoreSymlink (path name);
in
{
  home.packages = with pkgs; [
    eww-wayland
    wofi
    mako
    avizo
    swayidle
    swaylock-effects
  ];

  xdg.configFile = {
    eww.source = wrap "eww";
    wofi.source = wrap "wofi";
    hypr.source = wrap "hypr";
    mako.source = wrap "mako";
    avizo.source = wrap "avizo";
    swayidle.source = wrap "swayidle";
    swaylock.source = wrap "swaylock";
  };

  programs.zsh.profileExtra = "[[ $(tty) == /dev/tty1 ]] && exec Hyprland";
}
