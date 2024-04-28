local keymap = vim.keymap

-- Yank to system clipboard
keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "base: Yank to System Clipboard", })
-- Paste from system clipboard
keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "base: Paste from System Clipboard", })

-- Update Lazy
keymap.set({ "n" }, "<leader>ul", "<cmd>Lazy update<CR>", { desc = "base: Update Lazy", })
