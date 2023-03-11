{ inputs, pkgs, ... }:
{
	imports = [ inputs.hyprland.homeManagerModules.default ];
	
	home.packages = [ pkgs.mpvpaper ];

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

	xdg.dataHome = /home/ben/.local;

	xdg.dataFile.audio = {
		enable = true;
		executable = false;
		recursive = true;
		source = ../../assets/audio;
		target = "audio";
	};

	xdg.dataFile.wallpaper = {
		enable = true;
		executable = false;
		recursive = true;
		source = ../../assets/wallpaper;
		target = "wallpaper";
	};

  xdg.configFile.hypr = {
    source = ../../config/hypr;
    target = "hypr";
  };
}
