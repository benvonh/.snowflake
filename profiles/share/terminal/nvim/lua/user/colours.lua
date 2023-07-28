local function try_require(module)
    local ok, mod = pcall(require, module)

    if not ok then
        print('Failed to find ' .. module)
        return nil
    end

    return mod
end

local cat = try_require('catppuccin')
local kan = try_require('kanagawa')
local one = try_require('onedark')
local gvb = try_require('gruvbox')

if not (cat and kan and one and gvb) then
    return
end

cat.setup({
    styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = { 'italic' },
        functions = {},
        keywords = { 'italic' },
        strings = { 'bold' },
        variables = {},
        numbers = { 'bold' },
        booleans = { 'bold' },
        properties = {},
        types = {},
        operators = {},
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

kan.setup({
    compile = true,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = { bold = true },
    keywordStyle = { italic = true },
    statementStyle = { italic = true },
    typeStyle = { italic = true },
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    theme = "wave",
    background = {
        dark = "wave",
        light = "lotus",
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
        }
    end,
})

one.setup({
    style = 'darker',
    transparent = false,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    toggle_style_key = nil,
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    lualine = {
        transparent = false,
    },
    colors = {},
    highlights = {},
    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
})

gvb.setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,
    contrast = '',
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
})
