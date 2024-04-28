local M = {}

function M.setup()
    require("lspconfig").clangd.setup({})
    vim.keymap.set({ "n", "x", "o" }, "<A-o>", ":ClangdSwitchSourceHeader<CR>", { noremap = true }, { desc = "clangd: Toggle Between Source/Header Files" })
end

return M
