local kind = require("plugins.lsp.kind")
local cmp = require("plugins.lsp.cmp")

local lua_server = require("plugins.lsp.servers.lua")
local go_server = require("plugins.lsp.servers.go")
local clangd_server = require("plugins.lsp.servers.clangd")
local zig_server = require("plugins.lsp.servers.zig")
local gdscript_server = require("plugins.lsp.servers.gdscript")

local dependencies = {
    kind,
    cmp,
}

local keys = {
    {
        "<leader>lsp",
        "<cmd>LspInfo<CR>",
        desc = "base: LSP Information",
    },
    {
        "<leader>gd",
        function()
            require("telescope.builtin").lsp_definitions()
        end,
        desc = "base: Goto Definition (Telescope)",
    },
    {
        "<leader>dg",
        function()
            require("telescope.builtin").diagnostics()
        end,
        desc = "base: Browse LSP Diagnostics (Telescope)",
    },
    {
        "<leader>td",
        function()
            if vim.diagnostic.is_disabled(0) then
                vim.diagnostic.enable()
            else
                vim.diagnostic.disable()
            end
        end,
        desc = "base: Toggle LSP Diagnostics",
    },
    {
        "<leader>rr",
        function()
            local name = vim.fn.input("Rename: ")
            vim.lsp.buf.rename(name)
        end,
        desc = "base: LSP Rename"
    },
}

local opts = {}

local config = function()
    lua_server.setup()
    go_server.setup()
    clangd_server.setup()
    zig_server.setup()
    gdscript_server.setup()
end

return {
    -- https://github.com/neovim/nvim-lspconfig
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = dependencies,
        keys = keys,
        opts = opts,
        config = config,
    }
}
