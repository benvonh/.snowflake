local ok, term = pcall(require, 'toggleterm')

if not ok then
    print('Failed to find toggleterm')
    return
end

term.setup({
    size = 24,
    open_mapping = '<c-`>',
    hide_numbers = true,
    close_on_exit = true,
    shade_terminals = true,
    direction = 'horizontal',
})

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<c-h>', [[<cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<c-j>', [[<cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<c-k>', [[<cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<c-l>', [[<cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
