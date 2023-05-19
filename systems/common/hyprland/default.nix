{ inputs, outputs, lib, config, pkgs, ... }:
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

    # Screen lock
    swayidle
    swaylock-effects

    # Utilities
    sox  
    pamixer
    wlr-randr
    xdg-utils
    libnotify
    brightnessctl
  ];

  programs = {
    dconf.enable = true;
    hyprland.enable = true;
  };

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
