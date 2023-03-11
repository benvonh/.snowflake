{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ../../desktop
  ];

  # nixpkgs = {
  #   overlays = [
  #     outputs.overlays.additions
  #     outputs.overlays.modifications
  #     outputs.overlays.unstable-packages
  #   ];
  #   config = {
  #     allowUnfree = true;
  #     # Workaround for https://github.com/nix-community/home-manager/issues/2942
  #     allowUnfreePredicate = (_: true);
  #   };
  # };

  home = {
    username = "ben";
    homeDirectory = "/home/ben";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # Tools
    fd ripgrep unzip tldr 

    # Applications
    nvtop tty-clock

    # Rice
    pfetch pipes-rs
  ];

  # services.cbatticon = {
  #   enable = true;
  #   lowLevelPercent = 20;
  #   criticalLevelPercent = 10;
  #   commandCriticalLevel = "notify-send Battery 'Critically low...'";
  #   iconType = "standard";
  #   updateIntervalSeconds = 10;
  # };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
