{ inputs, pkgs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  programs.hyprland.enable = true;
  #programs.dconf.enable = true;

  # Swaylock password authentication bug
  security.pam.services.swaylock = {};

  environment.systemPackages = with pkgs; [
    # Components
    waybar wofi mpvpaper mako avizo 
    swayidle swaylock-effects

    # Tools
    libnotify pamixer
    brightnessctl sox 

    # Extra
    xdg-utils wlr-randr
  ];
}
