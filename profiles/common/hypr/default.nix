{ ... }:
{
  xdg.configFile = {
    hyprland = {
      enable = true;
      source = ./hyprland.conf;
      target = "hypr/hyprland.conf";
    };
    hyprpaper = {
      enable = true;
      source = ./hyprpaper.conf;
      target = "hypr/hyprpaper.conf";
    };
  };
}
