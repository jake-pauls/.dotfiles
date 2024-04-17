local keys = {
    {
        "<leader>xx",
        function()
            require("trouble").toggle()
        end,
        desc = "base: Trouble Toggle",
    },
    {
        "<leader>xw",
        function()
            require("trouble").toggle("workspace_diagnostics")
        end,
        desc = "base: Toggle Workspace Diagnostics (Trouble)",
    },
    {
        "<leader>xd",
        function()
            require("trouble").toggle("document_diagnostics")
        end,
        desc = "base: Toggle Document Diagnostics (Trouble)",
    },
    {
        "<leader>xq",
        function()
            require("trouble").toggle("quickfix")
        end,
        desc = "base: Toggle Quickfix List (Trouble)",
    },
    {
        "<leader>xl",
        function()
            require("trouble").toggle("loclist")
        end,
        desc = "base: Toggle Loclist (Trouble)",
    },
    {
        "gR",
        function()
            require("trouble").toggle("lsp_references")
        end,
        desc = "base: Toggle LSP References (Trouble)",
    },
}

local opts = {}

return {
    -- https://github.com/folke/trouble.nvim
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = keys,
    opts = opts,
}
