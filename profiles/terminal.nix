{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Tools
    fd
    ripgrep
    unzip
    tldr
    nodejs
    cargo

    # Apps
    ranger
    neovim
    nvtop
  ];

  programs.exa = {
    enable = true;
    enableAliases = true;
    git = true;
    icons = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff batman batgrep batwatch
    ];
  };

  programs.htop = {
    enable = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      truecolor = true;
      force_tty = false;
    };
  };

  programs.git = {
    enable = true;
    userName = "benvonh";
    userEmail = "benjaminvonsnarski@gmail.com";
  };

  programs.gh = {
    enable = true;
    settings = {
      editor = "hx";
      prompt = "enabled";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "nord";
      editor.scrolloff = 8;
    };
  };

  programs.taskwarrior = {
    enable = true;
  };

  xdg.configFile = with config.lib.file; {
    ranger = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/ranger";
      target = "ranger";
    };
    neovim = {
      source = mkOutOfStoreSymlink "${config.home.homeDirectory}/snow/config/nvim";
      target = "nvim";
    };
  };
}
