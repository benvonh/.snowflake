local ok, indent = pcall(require, 'indent_blankline')

if not ok then
    print('Failed to find indent-blankline')
    return
end

indent.setup({
    char = '▏',
    context_char = '▏',
    space_char_blankline = ' ',
    use_treesitter = false,
})
