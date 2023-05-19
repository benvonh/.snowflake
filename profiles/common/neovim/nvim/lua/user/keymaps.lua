local function remap(mode, lhs, rhs)
    local opts = { noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

------------
-- INSERT --
------------

-- exit insert mode
remap('i', '<c-c>', '<esc>')

------------
-- NORMAL --
------------

-- centre next search
remap('n', 'n', 'nzz')
remap('n', 'N', 'Nzz')

-- switch buffers
remap('n', 'L', '<cmd>bnext<cr>')
remap('n', 'H', '<cmd>bprev<cr>')

-- split window
remap('n', '<c-s>', '<cmd>split<cr>')
remap('n', '<c-x>', '<cmd>vsplit<cr>')

-- move between panes
remap('n', '<c-h>', '<c-w>h')
remap('n', '<c-j>', '<c-w>j')
remap('n', '<c-k>', '<c-w>k')
remap('n', '<c-l>', '<c-w>l')

-- move panes
remap('n', '<a-h>', '<c-w>H')
remap('n', '<a-j>', '<c-w>J')
remap('n', '<a-k>', '<c-w>K')
remap('n', '<a-l>', '<c-w>L')

-- resize panes
remap('n', '<c-up>',    '<cmd>resize -2<cr>')
remap('n', '<c-down>',  '<cmd>resize +2<cr>')
remap('n', '<c-left>',  '<cmd>vertical resize -2<cr>')
remap('n', '<c-right>', '<cmd>vertical resize +2<cr>')

------------
-- VISUAL --
------------

-- don't cut with paste
remap('v', 'p', '"_dp')

-- copy to clipboard
remap('v', 'yc', '"+y')
remap('v', 'Yc', '"+yy')

-- stay indent
remap('v', '<', '<gv')
remap('v', '>', '>gv')

-- move lines
remap('v', 'J', ':m \'>+1<cr>gv=gv')
remap('v', 'K', ':m \'<-2<cr>gv=gv')
