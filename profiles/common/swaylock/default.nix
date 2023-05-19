{ pkgs, ... }:
{
  #programs.swaylock = {
  #  enable = true;
  #  package = pkgs.swaylock-effects;
  #  settings = {
  #    clock = true;
  #    timestr = "LOCKED";
  #    datestr = "%T";
  #    screenshot = true;

  #    bs-hl-color = "5E81AC";
  #    key-hl-color = "8FBCBB";

  #    font = "FiraCode Nerd Font";
  #    font-size = 24;

  #    fade-in = 1;

  #    indicator-idle-visible = true;
  #    indicator-radius = 128;
  #    indicator-thickness = 4;

  #    inside-color = "2E3440";
  #    inside-clear-color = "2E3440";
  #    inside-ver-color = "2E3440";
  #    inside-wrong-color = "2E3440";

  #    line-color = "4C566A";
  #    line-clear-color = "5E81AC";
  #    line-ver-color = "EBCB8B";
  #    line-wrong-color = "BF616A";

  #    ring-color = "4C566A";
  #    ring-clear-color = "5E81AC";
  #    ring-ver-color = "EBCB8B";
  #    ring-wrong-color = "BF616A";

  #    separator-color = "4C566A";
  #    text-color = "8FBCBB";
  #    text-clear-color = "8FBCBB";
  #    text-ver-color = "8FBCBB";
  #    text-wrong-color = "8FBCBB";

  #    effect-blur = "7x5";
  #    effect-pixelate = 9;
  #    effect-vignette = "0.5:0.5";
  #  };
  #};

  xdg.configFile = {
    swaylock = {
      enable = true;
      source = ./swaylock/config;
      target = "swaylock/config";
    };
    swayidle = {
      enable = true;
      source = ./swayidle/config;
      target = "swayidle/config";
    };
  };
}
