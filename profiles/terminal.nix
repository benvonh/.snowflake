{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Tools
    fd
    ripgrep
    unzip
    tldr
    nmap

    # Meta
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

  programs.vim = {
    enable = true;
    extraConfig = ''
      ;------------
      ;-- INSERT --
      ;------------

      ; exit insert mode
      inoremap <c-c> <esc>

      ;------------
      ;-- NORMAL --
      ;------------

      ; centre next search
      nnoremap n nzz
      nnoremap N Nzz

      ; switch buffers
      nnoremap L <cmd>bnext<cr>
      nnoremap H <cmd>bprev<cr>

      ; split window
      nnoremap <c-s> <cmd>split<cr>
      nnoremap <c-x> <cmd>vsplit<cr>

      ; move between panes
      nnoremap <c-h> <c-w>h
      nnoremap <c-j> <c-w>j
      nnoremap <c-k> <c-w>k
      nnoremap <c-l> <c-w>l

      ; move panes
      nnoremap <a-h> <c-w>H
      nnoremap <a-j> <c-w>J
      nnoremap <a-k> <c-w>K
      nnoremap <a-l> <c-w>L

      ; resize panes
      nnoremap <c-up>    <cmd>resize -2<cr>
      nnoremap <c-down>  <cmd>resize +2<cr>
      nnoremap <c-left>  <cmd>vertical resize -2<cr>
      nnoremap <c-right> <cmd>vertical resize +2<cr>

      ;------------
      ;-- VISUAL --
      ;------------

      ; dont cut with paste
      vnoremap p "_dp

      ; stay indent
      vnoremap < <gv
      vnoremap > >gv

      ; move lines
      vnoremap J :m \>+1<cr>gv=gv
      vnoremap K :m \<-2<cr>gv=gv
    '';
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
