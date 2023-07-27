{ ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark";
    settings = {
      window_padding_width = 0;
      cursor_shape = "block";
      placement_strategy = "center";
      shell_integration = "no-cursor";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 11;
    };
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
