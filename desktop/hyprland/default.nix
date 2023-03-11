{ inputs, config, pkgs, ... }:
{
  imports = [
    ./gtk.nix
    # FIXME: Unnecessary because of below error
    # inputs.hyprland.homeManagerModules.default
  ];
  
  home.packages = with pkgs; [
    # Components
    waybar
    wofi
    mpvpaper
    swaylock-effects

    # Services
    mako
    avizo
    swayidle

    # Utilities
    # xdg-utils
    wlr-randr
    libnotify
    sox
  ];
	
	# FIXME: Causes build error
	# -----
	# programs.hyprland.enable = true;
	# => fixes error in systems/zeph/default.nix
	# -----
	# wayland.windowManager.hyprland = {
	# 	enable = true;
	# 	xwayland = {
	# 		enable = false;
	# 		hidpi = false;
	# 	};
	# };

  xdg.dataFile = {
    audio = {
      enable = true;
      executable = false;
      recursive = true;
      source = ../../assets/audio;
      target = "audio";
    };
    wallpaper = {
      enable = true;
      executable = false;
      recursive = true;
      source = ../../assets/wallpaper;
      target = "wallpaper";
    };
  };

  xdg.configFile = with config.lib.file; {
    hypr = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/hypr";
      target = "hypr";
    };
    waybar = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/waybar";
      target = "waybar";
    };
    wofi = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/wofi";
      target = "wofi";
    };
    swaylock = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/swaylock";
      target = "swaylock";
    };
    mako = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/mako";
      target = "mako";
    };
    avizo = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/avizo";
      target = "avizo";
    };
    swayidle = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/swayidle";
      target = "swayidle";
    };
  };
}
