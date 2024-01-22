local kind = require("plugins.lsp.kind")
local cmp = require("plugins.lsp.cmp")
local lua_server = require("plugins.lsp.servers.lua")

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
}

local opts = {}

local config = function()
    lua_server.setup()
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
