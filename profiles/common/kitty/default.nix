{ ... }:
{
  programs.kitty = {
    enable = true;
    theme = "kanagawabones";
    settings = {
      window_padding_width = 2;
      placement_strategy = "center";
    };
    font = {
      name = "MesloLGS NF";
      size = 10;
    };
    #shellIntegration = {
    #  enableFishIntegration = true;
    #};
  };
}
