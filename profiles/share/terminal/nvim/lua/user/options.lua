local opt = vim.opt

-- editor
opt.wrap = false
opt.confirm = true
opt.scrolloff = 16
opt.splitbelow = true
opt.splitright = true

-- visuals
opt.number = true
opt.syntax = 'yes'
opt.pumheight = 8
opt.cursorline = true
opt.visualbell = true
opt.signcolumn = 'yes'
opt.colorcolumn = { 120 }
opt.termguicolors = true

-- search
opt.hlsearch = false
opt.incsearch = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smarttab = true
opt.expandtab = true

-- indentation
opt.shiftround = true
opt.autoindent = true
opt.smartindent = true

-- history
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

-- C/C++ override tab size
-- vim.cmd [[
--   autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2
-- ]]

-- others
opt.timeoutlen = 500
opt.mouse = 'a'
opt.completeopt = 'menu,menuone,noselect'

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vimtex options
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
vim.g.vimtex_compiler_method = 'latexrun'
vim.maplocalleader = ','

-- neovim auto-session options
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,winsize,winpos'
