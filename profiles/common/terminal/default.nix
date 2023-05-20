{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Commands
    exiftool
    fd
    nmap
    ripgrep
    tldr
    trash-cli
    unzip

    # Programming
    cargo
    clang
    clang-tools
    nodejs
    python3
  ];

  programs = {
    exa = {
      enable = true;
      enableAliases = true;
      icons = true;
      git = true;
    };
    bat = {
      enable = true;
      config.theme = "Coldark-dark";
      extraPackages = with pkgs.bat-extras; [
        batdiff batman batgrep batwatch
      ];
    };
    htop = {
      enable = true;
    };
    btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
        truecolor = true;
        force_tty = false;
      };
    };
  };
}
