{ pkgs, config, sharePath, ... }:
let
  name = "hypr";
  hyprPath = sharePath name;
in
{
  programs.zsh.profileExtra = ''
    [[ $(tty) == /dev/tty1 ]] && exec Hyprland
  '';

  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink hyprPath;
    target = name;
  };

  environment.systemPackages = with pkgs; [
    # Desktop components
    mpvpaper
    mako
    avizo
    eww-wayland
    swaylock-effects

    # Utilities
    brightnessctl
    libnotify
    pamixer
    sox  
    wl-clipboard
    wlr-randr
    xdg-utils
  ];
}
