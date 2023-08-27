{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ./hardware.nix

    ../share/common
    ../share/hyprland

    inputs.hardware.nixosModules.asus-zephyrus-ga402
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 3;
      efi.canTouchEfiVariables = true;
    };
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

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [ "FiraCode" ];
    })
  ];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    iptables
    spice-gtk
    virt-manager
  ];
}
