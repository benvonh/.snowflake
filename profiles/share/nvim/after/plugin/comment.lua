local ok, comment = pcall(require, 'Comment')

if not ok then
    print('Failed to find comment')
    return
end

comment.setup({
    toggler = {
        line = 'cl',
        block = 'cb',
    },
    opleader = {
        line = 'gl',
        block = 'gb',
    },
})
