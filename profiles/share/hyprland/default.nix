{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: share "hyprland/${name}";
  wrap = name: config.lib.file.mkOutOfStoreSymlink (path name);
in
{
  home.packages = with pkgs; [
    # Components
    mako
    avizo
    swayidle
    eww-wayland
    rofi-wayland
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
    rofi.source = wrap "rofi";
    hypr.source = wrap "hypr";
    mako.source = wrap "mako";
    avizo.source = wrap "avizo";
    swayidle.source = wrap "swayidle";
    swaylock.source = wrap "swaylock";
  };
}
