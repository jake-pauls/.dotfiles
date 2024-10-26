local cmd = vim.cmd

local nordopts = {
    transparent = false,
    terminal_colors = true,
    borders = true,
    search = {
        theme = "vscode",
    },
    styles = {
        comments = {
            italic = true,
        },
        functions = {
            bold = false,
            italic = true,
        },
    },
}

local config = function()
    require("nord").setup(nordopts)
    cmd.colorscheme("nord")
end

return {
    -- https://github.com/gbprod/nord.vim
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = config,
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
