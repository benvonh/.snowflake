{ inputs, outputs, lib, config, pkgs, share, ... }:
let
  path = name: share "terminal/${name}";
in
{
  home.packages = with pkgs; [
    #evince            # PDF thumbnail
    #exiftool          # Image metadata
    fd                # Better find
    #ffmpegthumbnailer # Image thumbnail
    jq                # Json parser
    nmap              # Network mapper
    rclone            # Cloud sync
    ripgrep           # Better grep
    shotman           # Screenshot
    socat             # Cat for socket
    tldr              # Better help
    trash-cli         # Trash system
    unzip             # Unzip tool
    neofetch
    tty-clock pipes-rs cava
    ranger
    neovim
    clang-tools
    cmake-language-server
    pyright
    rnix-lsp
    sumneko-lua-language-server
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
  ];

  xdg.configFile = with lib; {
    zsh.source = mkOutOfStoreSymlink (path zsh);
    nvim.source = mkOutOfStoreSymlink (path nvim);
    ranger.source = mkOutOfStoreSymlink (path ranger);
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

  program.htop = {
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
    enableSyntaxHighlighting = true;
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
    initExtraFirst = "source ${(share zsh)}/setup.zsh";
    shellAliases = {
      ga = "git add";
      gd = "git diff";
      gp = "git push";
      gc = "git commit";
      gs = "git status";
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
