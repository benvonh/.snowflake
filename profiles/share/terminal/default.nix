{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # PDF thumbnail
    evince
    # Image metadata
    exiftool
    # Better find
    fd
    # Image thumbnail
    ffmpegthumbnailer
    # Networking
    nmap
    # Cloud syncing
    rclone
    # Better grep
    ripgrep
    # Screenshot
    shotman
    # Better help
    tldr
    # Trash system
    trash-cli
    # Unzip tool
    unzip

    # C/C++
    clang
    clang-tools
    cmake-language-server
    # Python
    python3
    pyright
    # Nix
    rnix-lsp
    # Rust
    cargo
    # Latex
    biber
    zathura
    latexrun
    # Lua
    sumneko-lua-language-server
    # Node
    yarn
    nodejs
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.dockerfile-language-server-nodejs
  ];

  programs = {
    # Better ls
    exa = {
      enable = true;
      enableAliases = true;
      icons = true;
      git = true;
    };
    # Better cat + more
    bat = {
      enable = true;
      config.theme = "Coldark-Dark";
      extraPackages = with pkgs.bat-extras; [
        batdiff batman batgrep batwatch
      ];
    };
    # Better top
    htop = {
      enable = true;
    };
    # Better htop
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
