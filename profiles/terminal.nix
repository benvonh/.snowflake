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
    icons = true;
    git = true;
  };

  programs.bat = {
    enable = true;
    config.theme = "TwoDark";
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
#      editor = {
#        line-ending = "lf";
#        tab-width = 4;
#        scrolloff = 8;
#        auto-indent = true;
#        incremental-search = true;
#      };
#      keys = {
#        normal."G" = "move_end_of_file";
#        normal."g g" = "move_start_of_file";
#        normal.";" = "search_next";
#        normal."," = "search_prev";
#        normal."z z" = "center_view";
#        normal."z t" = "align_view_top";
#        normal."z b" = "align_view_bottom";
#        visual."y" = "yank";
#        visual."Y" = "yank_line";
#        insert."<c-c>" = "normal_mode";
#        insert."<c-r>" = "insert_mode_paste";
#      };
#      language_servers = {
#        lsp = {
#          rust_analyzer = {
#            command = "rust-analyzer";
#            filetypes = ["rust"];
#          };
#          pyright = {
#            command = "pyright-langserver";
#            args = ["--stdio"];
#            filetypes = ["python"];
#          };
#          tsserver = {
#            command = "typescript-language-server";
#            args = ["--stdio"];
#            filetypes = ["javascript" "typescript"];
#          };
#          clangd = {
#            command = "clangd";
#            args = ["--background-index" "--clang-tidy" "--completion-style=bundled" "--header-insertion=iwyu"];
#            filetypes = ["c" "cpp" "objc" "objcpp" "cc"];
#          };
#        };
#      };
#      language.rust.indent = 4;
#      language.rust.tab_width = 4;
#
#      language.python.indent = 4;
#      language.python.tab_width = 4;
#
#      language.go.indent = 4;
#      language.go.tab_width = 4;
#
#      language.javascript.indent = 2;
#      language.javascript.tab_width = 2;
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
