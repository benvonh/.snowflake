local ok, session = pcall(require, 'auto-session')

if not ok then
    print('Failed to find auto-session')
    return
end

session.setup({
    auto_session_enable_last_session = false,
    auto_session_enabled = true,
    auto_session_create_enabled = false,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_use_git_branch = false,
})
