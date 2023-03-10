local function try_require(module)
    local ok, mod = pcall(require, module)

    if not ok then
        print('Failed to find ' .. module)
        return nil
    end

    return mod
end

local nod = try_require('nord')
local cat = try_require('catppuccin')

if not (nod and cat) then
    return
end

cat.setup({
    styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = { 'italic' },
        functions = { 'italic' },
        keywords = {},
        strings = { 'bold' },
        variables = {},
        numbers = { 'bold' },
        booleans = { 'bold' },
        properties = {},
        types = {},
        operators = { 'italic' },
    },
    color_overrides = {
        mocha = { pink = '#FAB387' },
    },
    integrations = {
        cmp = true,
        mason = true,
        nvimtree = true,
        which_key = true,
        telescope = true,
        treesitter = true,
        native_lsp = { enabled = true },
    },
})
