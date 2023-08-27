{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    vimix-cursors
    sddm-astronaut-theme
  ];

  programs.hyprland.enable = true;

  sound.enable = false;
  hardware.pulseaudio.enable = false;

  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "astronaut";
      settings = {
        Theme = {
          CursorTheme = "dist-white";
        };
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock = {};
  };
}
