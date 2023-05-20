{ ... }:
{
  programs.kitty = {
    enable = true;
    theme = "One Half Dark";
    settings = {
      window_padding_width = 2;
      placement_strategy = "center";
    };
    font = {
      name = "FiraCode Nerd Font Mono";
      size = 10;
    };
    #shellIntegration = {
    #  enableFishIntegration = true;
    #};
  };
}
