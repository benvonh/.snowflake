{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: share "hyprland/${name}";
  wrap = name: config.lib.file.mkOutOfStoreSymlink (path name);
in
{
  home.packages = with pkgs; [
    # Components
    avizo
    eww-wayland
    mako
    mpvpaper
    rofi-wayland
    swayidle
    swaylock-effects

    # Utilities
    libnotify
    pamixer
    sox
    wlr-randr
    wl-clipboard
    xdg-utils
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
