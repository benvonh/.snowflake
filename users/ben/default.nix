{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    ../../desktop
  ];

  # FIXME: Error due to Home Manager used as NixOS module
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

  home.username = "ben";
  home.homeDirectory = "/home/ben";

	xdg.dataHome = /home/ben/.local;
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
