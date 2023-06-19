{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    # Desktop components
    wofi
    waybar
    mpvpaper
    mako
    avizo

    # FIXME: Wait for next release to fix Hyprland bug
    inputs.eww.packages.${system}.eww-wayland

    # Screen lock
    swayidle
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

  programs.hyprland.enable = true;

  security = {
    rtkit.enable = true;
    pam.services.swaylock = {};
  };

  sound.enable = false;
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
