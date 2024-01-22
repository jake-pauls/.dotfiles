local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local Base = augroup("Base", {
    clear = true,
})

local Yank = augroup("Yank", {
    clear = true,
})

-- Remove all whitespace before writing buffer
autocmd("BufWritePre", {
    group = Base,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Restore cursor to last position when opening file
autocmd("BufReadPost", {
    group = Base,
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
             vim.fn.setpos('.', vim.fn.getpos("'\""))
             vim.api.nvim_feedkeys('zz', 'n', true)
        end
    end,
})

-- Highlight text post-yank
autocmd("TextYankPost", {
    group = Yank,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 225,
        })
    end,
})
