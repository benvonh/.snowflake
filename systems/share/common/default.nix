{ inputs, outputs, lib, config, pkgs, ... }:
{
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Europe/Berlin";
  #time.timeZone = "Australia/Brisbane";

  environment.systemPackages = with pkgs; [
    busybox vim git
  ];

  system.stateVersion = "23.05";
}
