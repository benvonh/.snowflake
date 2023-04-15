{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ./hardware.nix
    
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-laptop-ssd

    ../common.nix
    ../hyprland.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "pcie_aspm.policy=powersupersave"
      "acpi.prefer_microsoft_dsm_guid=1"
    ];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 2;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "zeph";

  services.openssh = {
    enable = false;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };

  services.printing = {
    enable = true;
  };

  system.stateVersion = "22.11";
}
