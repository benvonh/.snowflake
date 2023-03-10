local ok, wk = pcall(require, 'which-key')

if not ok then
    print('Failed to find which-key')
    return
end

vim.g.mapleader = ' '
-- basic commands
wk.register({
    ['<leader>q'] = { '<cmd>q<cr>',                         'Quit buffer' },
    ['<leader>w'] = { '<cmd>w<cr>',                         'Write buffer' },
    ['<leader>x'] = { '<cmd>x<cr>',                         'Save and quit buffer' },
    ['<leader>m'] = { '<cmd>messages<cr>',                  'Open messages' },
    ['<leader>r'] = { '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>',   'Remove buffer' },
    ['<leader>v'] = { '<cmd>vsplit<cr>',                    'Split vertically' },
    ['<leader>h'] = { '<cmd>split<cr>',                     'Split horizontally' },
    ['<leader>'] = {
        z = {
            name = '+Neovim',
            c = { '<cmd>qa<cr>',             'Close neovim' },
            a = { '<cmd>qa!<cr>',            'Abandon neovim' },
            x = { '<cmd>wa<cr>',             'Save all in neovim' },
            z = { '<cmd>wa<cr> <cmd>qa<cr>', 'Save and quit neovim' },
        },
    },
})

-- plugin commands
wk.register({
    -- file explorer
    ['<leader>e'] = { '<cmd>NvimTreeFindFileToggle<cr>',        'Focus tree' },
    ['<leader>c'] = { '<cmd>NvimTreeCollapseKeepBuffers<cr>',   'Collapse tree' },
    -- telescope
    ['<leader>b'] = { '<cmd>Telescope buffers<cr>',             'Find buffer' },
    ['<leader>l'] = { '<cmd>Telescope live_grep<cr>',           'Find word' },
    ['<leader>f'] = {
        function()
            local ok, _ = pcall(vim.cmd, 'Telescope git_files')
            if not ok then
                print('Not in Git repository')
            end
        end,
        'Find file in git'
    },
    ['<leader>p'] = {
        function()
            vim.ui.input(
                { prompt = 'Search file location: ' },
                function(input)
                    if input == nil then
                        input = '.'
                    end
                    print('Searching in ' .. input)
                    vim.cmd('Telescope find_files cwd=' .. input)
                end
            )
        end,
        'Find file anywhere'
    },
    -- sessions
    ['<leader>'] = {
        s = {
            name = '+Session',
            s = {
                function()
                    vim.ui.input(
                        { prompt = 'Do you really want to save this session? [y/N] ' },
                        function(input)
                            if input == 'y' then
                                vim.cmd('SaveSession')
                                print('Session saved')
                            else
                                print('Cancelling save...')
                            end
                        end
                    )
                end,
                'Save session'
            },
            l = {
                '<cmd>Telescope session-lens search_session<cr>',
                'Session lens'
            },
        },
    },
})
