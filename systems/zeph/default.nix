{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ./hardware.nix

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-laptop-ssd

    ../share/common
    ../share/fonts
    ../share/hyprland
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "pcie_aspm.policy=powersupersave"
      "acpi.prefer_microsoft_dsm_guid=1"
    ];
    kernelModules = [
      "amdgpu"
    ];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  users.users.ben = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "tty"
      "wheel"
      "dialout"
      "networkmanager"
      "libvirtd"
      "docker"
    ];
  };

  networking = {
    hostName = "zeph";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };
    printing.enable = true;
  };

  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    iptables
    spice-gtk
  ];

  system.stateVersion = "22.11";
}
