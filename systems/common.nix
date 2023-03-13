{ inputs, outputs, lib, config, pkgs, ... }:
{
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

  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Australia/Brisbane";
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
    vim
    git
    pciutils
    pamixer
    brightnessctl
  ];

  users.users = {
    ben = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}