local opts = {
    indent = {
        char = "▏",
        tab_char = "",
    },
    scope = { enabled = false, },
    exclude = {
        filetypes = {
            "help",
            "alpha",
            "dashboard",
            "NvimTree",
            "lazy",
        },
    },
}

return {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        opts = opts,
        main = "ibl",
    }
}
