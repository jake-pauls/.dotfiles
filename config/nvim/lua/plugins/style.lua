local cmd = vim.cmd
local g = vim.g

return {
    -- https://github.com/arcticicestudio/nord-vim
    {
        "nordtheme/vim",
        lazy = false,
        priority = 1000,
        init = function()
            g.nord_contrast = true
            g.nord_disable_background = false
            g.nord_cursorline_transparent = true
        end,
        config = function()
            cmd.colorscheme("nord")
        end,
    },
    -- https://github.com/metalelf0/jellybeans-nvim
    {
        "metalelf0/jellybeans-nvim",
        lazy = false,
        priority = 1000,
        dependencies = {
            "rktjmp/lush.nvim"
        },
    },
    -- https://github.com/nvim-tree/nvim-web-devicons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
