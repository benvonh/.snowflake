local ok, comment = pcall(require, 'Comment')

if not ok then
    print('Failed to find comment')
    return
end

comment.setup({
    opleader = { line = '<c-_>' },
    mappings = { basic = true, extra = false },
})
