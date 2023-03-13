{ inputs, outputs, pkgs, ... }:
{
  imports = [ inputs.hyprland.nixosModules.default ];

  # nixpkgs.overlays = [ inputs.hyprpaper.overlays.default ];

  environment.systemPackages = with pkgs; [
    # Components
    waybar
    wofi
    hyprpaper
    mpvpaper
    swaylock-effects

    # Services
    mako
    avizo
    swayidle

    # Utilities
    # xdg-utils
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
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };  
}
