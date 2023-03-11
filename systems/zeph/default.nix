{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ./hardware.nix
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-laptop
    inputs.hardware.nixosModules.common-pc-laptop-ssd
    inputs.hyprland.nixosModules.default
    # FIXME: Under maintenance
    #../base
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

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
        extraInstallCommands = ''
          path=/boot/loader/entries
          entries=$(ls -x $path)
          sed -i '2s/.*/version backup/' $path/$(echo $entries | awk '{print $1}')
          sed -i '2s/.*/version latest/' $path/$(echo $entries | awk '{print $2}')
        '';
      };
      efi.canTouchEfiVariables = true;
    };
  };

  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Australia/Brisbane";

  networking.hostName = "zeph";
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

  users.users = {
    ben = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  programs.hyprland.enable = true;

  # Swaylock password authentication bug
  security.pam.services.swaylock = {};

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
