local kind = require("plugins.lsp.kind")
local cmp = require("plugins.lsp.cmp")

local servers = {
    require("plugins.lsp.servers.clangd"),
    require("plugins.lsp.servers.csharp"),
    require("plugins.lsp.servers.gdscript"),
    require("plugins.lsp.servers.go"),
    require("plugins.lsp.servers.lua"),
    require("plugins.lsp.servers.python"),
    require("plugins.lsp.servers.zig"),
}

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
            local name = vim.ui.input("Rename: ")
            vim.lsp.buf.rename(name)
        end,
        desc = "base: LSP Rename"
    },
}

local opts = {}

local config = function()
    for _, server in pairs(servers) do
        server.setup()
    end
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
