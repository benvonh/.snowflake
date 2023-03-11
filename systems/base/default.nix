# FIXME: Re-implement override design pattern
{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ./override.nix
  ];

  boot = mkOverridable boot {
    loader.systemd-boot.enable = true;

  }



  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking.hostName = "base";
  networking.networkmanager.enable = true;

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [ "FiraCode" ];
    })
  ];
  
  environment.systemPackages = with pkgs; [
    vim git pciutils
  ];

  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  services.printing = {
    enable = true;
  };

  system.stateVersion = "22.11";
}
