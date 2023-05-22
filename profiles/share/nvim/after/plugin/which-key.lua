local ok, wk = pcall(require, 'which-key')

if not ok then
    print('Failed to find which-key')
    return
end

vim.g.mapleader = ' '

-- basic commands
wk.register({
    ['<leader>q'] = { '<cmd>q<cr>', 'Quit buffer' },
    ['<leader>w'] = { '<cmd>w<cr>', 'Write buffer' },
    ['<leader>x'] = { '<cmd>x<cr>', 'Save and quit buffer' },
    ['<leader>m'] = { '<cmd>messages<cr>', 'Open messages' },
    ['<leader>r'] = { '<cmd>bp<bar>sp<bar>bn<bar>bd<cr>', 'Remove buffer' },
    ['<leader>v'] = { '<cmd>vsplit<cr>', 'Split vertically' },
    ['<leader>h'] = { '<cmd>split<cr>', 'Split horizontally' },
    ['<leader>'] = {
        z = {
            name = '+Neovim',
            x = { '<cmd>wa<cr>', 'Save all in neovim' },
            c = { '<cmd>NvimTreeClose<cr> <cmd>qa<cr>', 'Close neovim' },
            a = { '<cmd>NvimTreeClose<cr> <cmd>qa!<cr>', 'Abandon neovim' },
            z = { '<cmd>NvimTreeClose<cr> <cmd>wa<cr> <cmd>qa<cr>', 'Save and quit neovim' },
        },
    },
})

-- plugin commands
wk.register({
    -- file explorer
    ['<leader>t'] = { '<cmd>NvimTreeToggle<cr>', 'Toggle tree' },
    ['<leader>e'] = { '<cmd>NvimTreeFindFile<cr>', 'Focus tree' },
    ['<leader>c'] = { '<cmd>NvimTreeCollapseKeepBuffers<cr>', 'Collapse tree' },
    -- telescope
    ['<leader>b'] = { '<cmd>Telescope buffers<cr>', 'Find buffer' },
    ['<leader>l'] = { '<cmd>Telescope live_grep<cr>', 'Find word' },
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
                        { prompt = 'Create a session? ' },
                        function(input)
                            if input == 'y' then
                                vim.cmd('SessionSave')
                                print('New session created!')
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
    -- LSP
    ['<leader>n'] = {
        function()
            vim.ui.input(
                { prompt = 'Format using LSP? ' },
                function(input)
                    if input == 'y' then
                        vim.cmd('LspZeroFormat')
                        print('Formatted!')
                    end
                end
            )
        end,
        'LSP Format'
    },
})
