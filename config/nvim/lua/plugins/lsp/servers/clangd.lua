local M = {}

function M.setup()
    require("lspconfig").clangd.setup({})
    vim.keymap.set({ "n", "x" }, "<A-o><CR>", ":ClangdSwitchSourceHeader", { noremap = true }, { desc = "clangd: Toggle Between Source/Header Files" })
end

return M
