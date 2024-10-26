local o = vim.o
local g = vim.g
local api = vim.api

if g.neovide == true then
    o.guifont = "JetBrainsMono Nerd Font:h10"
    g.neovide_fullscreen = true
    g.neovide_theme = "auto"

    -- On some versions of Neovide the fullscreen = true doesn't seem to work, so this is a fail-safe
    api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
