local keymap = vim.keymap

-- Yank to system clipboard
keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "base: Yank to System Clipboard", })
-- Paste from system clipboard
keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "base: Paste from System Clipboard", })

-- Release Focus on Terminal Buffers
keymap.set({ "t" }, "<Esc>", "<C-\\><C-n>", { desc = "base: Release Focus on Terminal Buffer", })
-- Open Terminal Buffer in a Vertical Split
keymap.set({ "n" }, "<C-t>", ":vsplit | term<CR>", { noremap = true }, { desc = "base: Open Terminal in Split" })

-- Update Lazy
keymap.set({ "n" }, "<leader>ul", "<cmd>Lazy update<CR>", { desc = "base: Update Lazy", })
