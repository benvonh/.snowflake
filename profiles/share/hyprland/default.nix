{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: share "hyprland/${name}";
  wrap = name: config.lib.file.mkOutOfStoreSymlink (path name);
in
{
  home.packages = with pkgs; [
    # Services
    eww-wayland
    wofi
    mako
    avizo
    swayidle
    swaylock-effects

    # Utilities
    sox
    pamixer
    libnotify
    xdg-utils
    wlr-randr
    wl-clipboard
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
}
