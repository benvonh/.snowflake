local function try_require(module)
   local ok, mod = pcall(require, module)

   if not ok then
       print('Failed to find ' .. module)
       return nil
   end

   return mod
end

local Rule = try_require('nvim-autopairs.rule')
local cond = try_require('nvim-autopairs.conds')
local npairs = try_require('nvim-autopairs')

if not (Rule and cond and npairs) then
    return
end

npairs.setup({
    map_c_w = true,
    check_ts = true
})

npairs.add_rule(Rule('template<', '>', 'cpp')
    :with_cr(true):with_del(true)
    :with_move(cond.is_bracket_line_move())
)
