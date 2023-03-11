{ inputs, ... }:
{
	imports = [ inputs.hyprland.homeManagerModules.default ];

	# wayland.windowManager.hyprland = {
	# 	enable = true;
	# 	xwayland = {
	# 		enable = false;
	# 		hidpi = false;
	# 	};
	# };

  xdg.configFile.hypr = {
    source = ../../config/hypr;
    target = "hypr";
  };}