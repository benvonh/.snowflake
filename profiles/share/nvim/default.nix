{ config, pkgs, sharePath, ... }:
let
  name = "nvim";
  nvimPath = sharePath name;
in
{
  home.packages = with pkgs; [
    neovim
    clang-tools
    cmake-language-server
    pyright
    rnix-lsp
    sumneko-lua-language-server
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.dockerfile-language-server-nodejs
  ];

  xdg.configFile.${name} = with config.lib.file; {
    source = mkOutOfStoreSymlink nvimPath;
    target = name;
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
