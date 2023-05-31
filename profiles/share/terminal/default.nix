{ pkgs, ... }:
{
  home.packages = with pkgs; [
    evince            # PDF thumbnail
    exiftool          # Image metadata
    fd                # Better find
    ffmpegthumbnailer # Image thumbnail
    jq                # Json parser
    nmap              # Network mapper
    rclone            # Cloud sync
    ripgrep           # Better grep
    shotman           # Screenshot
    socat             # Cat for socket
    tldr              # Better help
    trash-cli         # Trash system
    unzip             # Unzip tool

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