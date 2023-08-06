{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: share "terminal/${name}";
  wrap = name: config.lib.file.mkOutOfStoreSymlink (path name);
in
{
  home.packages = with pkgs; [
    neovim            # Code editor
    ranger            # File manager

    fd                # Better find
    jq                # Json parser
    nmap              # Network tool
    rclone            # Cloud sync
    ripgrep           # Better grep
    shotman           # Screenshot
    socat             # Cat for socket
    tldr              # Better help
    unzip             # Unzip tool

    neofetch          # System info
    tty-clock         # Cool clock
    pipes-rs          # Pipes
    cava              # Audio visualiser

    clang-tools
    cmake-language-server
    pyright
    rnix-lsp
    sumneko-lua-language-server
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
  ];

  xdg.configFile = {
    zsh.source = wrap "zsh";
    nvim.source = wrap "nvim";
    ranger.source = wrap "ranger";
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
    icons = true;
    git = true;
  };

  programs.bat = {
    enable = true;
    config.theme = "Coldark-Dark";
    extraPackages = with pkgs.bat-extras; [
      batdiff batman batgrep batwatch
    ];
  };

  programs.git = {
    enable = true;
    userName = "benvonh";
    userEmail = "benjaminvonsnarski@gmail.com";
  };

  programs.gh = {
    enable = true;
    settings = {
      editor = "nvim";
      prompt = "enabled";
    };
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

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    envExtra = ''
      export TERM=kitty
      export EDITOR=nvim
      export OPENER=bat
      export PAGER='bat --force-colorization --paging=always --style=full'
    '';
    initExtra = ''
      bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
      bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
    '';
    initExtraFirst = "source ${(path "zsh")}/setup.zsh";
    shellAliases = {
      ga = "git add";
      gd = "git diff";
      gp = "git push";
      gc = "git commit";
      gs = "git status";
      nd = "nix develop";
      hms = "home-manager switch --flake ~/.snow";
      nrs = "sudo nixos-rebuild switch --flake ~/.snow";
      nsz = "nix-shell --run zsh";
    };
    zplug = {
      enable = true;
      plugins = [
        { 
          name = "romkatv/powerlevel10k";
          tags = [ as:theme depth:1 ];
        }
        {
          name = "marlonrichert/zsh-autocomplete";
          tags = [ as:plugin depth:1 ];
        }
      ];
    };
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      share = false;
    };
    historySubstringSearch = {
      enable = true;
    };
  };
}
