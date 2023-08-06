{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.systemPackages = [
    pkgs.graphite-cursors
    pkgs.sddm-chili-theme
  ];

  programs.hyprland.enable = true;

  sound.enable = false;
  hardware.pulseaudio.enable = false;

  services.xserver = {
    enable = true;
    displayManager.sessionCommands = ''
      ${pkgs.xorg.xrdb}/bin/xrdb -merge <<EOF
      Xft.dpi: 100
      EOF
    '';
    displayManager.sddm = {
      enable = true;
      theme = "chili";
      settings = {
        Theme = {
          CursorTheme = "graphite-light";
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
