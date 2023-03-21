{ inputs, outputs, pkgs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    # Components
    waybar
    wofi
    #mpvpaper
    swaylock-effects

    # Services
    mako
    avizo
    swayidle

    # Utilities
    wlr-randr
    libnotify
    sox  
  ];

  programs.hyprland.enable = true;

  security.pam.services.swaylock = {};
  security.rtkit.enable = true;

  sound.enable = false;
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
