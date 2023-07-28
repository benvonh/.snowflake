{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ./hardware.nix

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop-ssd

    ../share/common
    ../share/fonts
    ../share/hyprland
  ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.systemd-boot.configurationLimit = 3;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "amdgpu" ];
    kernelParams = [
      "pcie_aspm.policy=powersupersave"
      "acpi.prefer_microsoft_dsm_guid=1"
    ];
  };

  services = {
    printing.enable = true;
    openssh.enable = true;
    openssh.settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  networking = {
    hostName = "zeph";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  programs.zsh.enable = true;
  users.users.ben = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "tty"
      "wheel"
      "dialout"
      "networkmanager"
      "libvirtd"
    ];
  };

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = [
    pkgs.iptables
    pkgs.spice-gtk
    pkgs.virt-manager
  ];
}
