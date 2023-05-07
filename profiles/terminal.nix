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

  home.file.".vimrc".text = ''
    inoremap <c-c> <esc>

    nnoremap n nzz
    nnoremap N Nzz

    nnoremap L <cmd>bnext<cr>
    nnoremap H <cmd>bprev<cr>

    nnoremap <c-s> <cmd>split<cr>
    nnoremap <c-x> <cmd>vsplit<cr>

    nnoremap <c-h> <c-w>h
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-l> <c-w>l

    nnoremap <a-h> <c-w>H
    nnoremap <a-j> <c-w>J
    nnoremap <a-k> <c-w>K
    nnoremap <a-l> <c-w>L

    nnoremap <c-up>    <cmd>resize -2<cr>
    nnoremap <c-down>  <cmd>resize +2<cr>
    nnoremap <c-left>  <cmd>vertical resize -2<cr>
    nnoremap <c-right> <cmd>vertical resize +2<cr>

    vnoremap p "_dp

    vnoremap < <gv
    vnoremap > >gv

    vnoremap J :m \>+1<cr>gv=gv
    vnoremap K :m \<-2<cr>gv=gv
  '';
}
