return {
    -- https://github.com/shaunsingh/nord.nvim
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("nord")
        end,
        init = function()
            vim.g.nord_contrast = true
            vim.g.nord_disable_background = true
            vim.g.nord_cursorline_transparent = true
        end,
    },
    -- https://github.com/nvim-tree/nvim-web-devicons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
