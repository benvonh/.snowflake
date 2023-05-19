local ok, tree = pcall(require, 'nvim-treesitter.configs')

if not ok then
    print('Failed to find tree-sitter')
    return
end

tree.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
