local opt = vim.opt

-- editor
opt.wrap = false
opt.confirm = true
opt.scrolloff = 16
opt.splitbelow = true
opt.splitright = true

-- visuals
opt.number = true
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
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
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

-- others
opt.timeoutlen = 500
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menu,menuone,noselect'

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- neovim auto-session options
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,winsize,winpos'
