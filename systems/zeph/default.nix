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

  programs.zsh.enable = true;

  networking = {
    hostName = "zeph";
    networkmanager.enable = true;
    firewall.enable = true;
    nat = {
      enable = true;
      externalInterface = "wlp5s0";
      internalInterfaces = [ "enp8s0f4u1u4" ];
    };
    interfaces.enp8s0f4u1u4 = {
      ipv4.addresses = [
        {
          address = "192.168.0.1";
          prefixLength = 24;
        }
      ];
    };
  };

  services = {
    dhcpd4 = {
      enable = true;
      interfaces = [ "enp8s0f4u1u4" ];
      extraConfig = ''
        subnet 192.168.0.0 netmask 255.255.255.0 {
          range 192.168.0.10 192.168.0.20;
          option routers 192.168.0.1;
          option domain-name-servers 8.8.8.8, 8.8.4.4;
        }
      '';
    };
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
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

  system.stateVersion = "23.05";
}
