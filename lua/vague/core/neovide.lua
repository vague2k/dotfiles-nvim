if vim.g.neovide then
    vim.g.neovide_scroll_animation_length = 0.2
    vim.g.neovide_cursor_trail_size = 0.5
    vim.g.neovide_input_macos_alt_is_meta = true
    vim.g.neovide_cursor_vfx_mode = "wireframe"
end

if vim.loop.os_uname().sysname == "Darwin" then
    vim.g.neovide_input_macos_alt_is_meta = true
    vim.g.neovide_transparency = 0.95
    vim.g.neovide_window_blurred = false
end
