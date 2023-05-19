{ pkgs, ... }:
{
  home.packages = [ pkgs.neovim ];

  xdg.configFile.nvim = {
    enable = true;
    source = ./nvim;
    target = "nvim";
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
