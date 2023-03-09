{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example
  ];

  nixpkgs = {
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "ben";
    homeDirectory = "/home/ben";
  };

  programs.home-manager.enable = true;

  programs.exa = {
    enable = true;
    enableAliases = true;
    #git = true;
    #icons = true;
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

  programs.git = {
    enable = true;
    userName = "benvonh";
    userEmail = "benjaminvonsnarski@gmail.com";
  };

  #programs.gh = {
  #  enable = true;
  #};

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

  programs.taskwarrior = {
    enable = true;
  };

  programs.helix = {
    enable = true;
    settings = {
      themes = "nord";
      editor.scrolloff = 8;
    };
  };

  home.packages = with pkgs; [
    # Tools
    fd ripgrep unzip tldr 

    # Applications
    gh ranger nvtop cava tty-clock

    # Rice
    neofetch pfetch pipes-rs
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    #defaultKeymap = "emacs";
    dotDir = ".config/zsh";
    initExtraFirst = "source ~/.config/zsh/extra.zsh";
    history.share = false;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.numix-cursor-theme;
      name = "Numix-Cursor-Light";
      size = 24;
    };
    iconTheme = {
      package = pkgs.numix-icon-theme-circle;
      name = "Numix-Circle";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };
  };

  services.cbatticon = {
    enable = true;
    lowLevelPercent = 20;
    criticalLevelPercent = 10;
    commandCriticalLevel = "notify-send Battery 'Critically low...'";
    iconType = "standard";
    updateIntervalSeconds = 10;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
