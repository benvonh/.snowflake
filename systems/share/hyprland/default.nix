{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  programs.hyprland.enable = true;

  sound.enable = false;
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock = {};
  };
}
