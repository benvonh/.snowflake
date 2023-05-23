{ ... }:
{
  programs.kitty = {
    enable = true;
    theme = "kanagawabones";
    settings = {
      window_padding_width = 0;
      placement_strategy = "center";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };
    #shellIntegration = {
    #  enableFishIntegration = true;
    #};
  };
}
