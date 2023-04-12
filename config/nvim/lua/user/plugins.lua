local fn = vim.fn

-- automatic packer install
local packer_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim',
        packer_path
    })
    print('Installing packer...')
    vim.cmd('packadd packer.nvim')
end

-- initialise packer
local ok, packer = pcall(require, 'packer')

if not ok then
    print('Failed to find packer')
    return
end

packer.init({
    max_jobs = 8,
    display = {
        prompt_border = 'rounded',
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})

-- manage plugins
return packer.startup(function(use)

    -- packer
    use 'wbthomason/packer.nvim'

    -- key binding
    use 'folke/which-key.nvim'

    -- better coding
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use 'lukas-reineke/indent-blankline.nvim'

    -- nix
    use 'LnL7/vim-nix'

    -- colour scheme
    use { 'shaunsingh/nord.nvim', as = 'nord' }
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- tree sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = '<cmd>TSUpdate<cr>'
    }

    -- markdown preview
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end
    }

    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- buffer line
    use {
        'akinsho/bufferline.nvim', tag = "v3.*",
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- sessions
    use {
        'rmagatti/auto-session',
        requires = {
            { 'rmagatti/session-lens' },
            { 'nvim-telescope/telescope.nvim' },
        }
    }

    -- lsp + cmp
    use { 'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- completion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            -- snippets
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- bootstrap
    if PACKER_BOOTSTRAP then
        packer.sync()
    end

end)
