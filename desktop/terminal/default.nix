{ config, pkgs, ... }:
{
  imports = [
    ./rice.nix
  ];

  home.packages = with pkgs; [
    # Commands
    fd
    ripgrep
    unzip
    tldr

    # Applications
    ranger
    neovim
    nvtop
  ];

  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff batman batgrep batwatch
    ];
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

  programs.exa = {
    enable = true;
    enableAliases = true;
    #git = true;
    #icons = true;
  };

  programs.gh = {
    enable = true;
    settings = {
      editor = "hx";
      prompt = "enabled";
    };
  };

  programs.git = {
    enable = true;
    userName = "benvonh";
    userEmail = "benjaminvonsnarski@gmail.com";
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "nord";
      editor.scrolloff = 8;
    };
  };

  programs.htop = {
    enable = true;
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