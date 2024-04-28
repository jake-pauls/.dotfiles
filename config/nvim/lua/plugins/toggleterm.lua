local opts = {
    size = 20,
    open_mapping = [[<C-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shade_factor = 2,
    start_in_insert = true,
    direction = "float",
    close_on_exit = true,
    float_opts = {
        border = "single",
        winblend = 0,
    },
}

return {
    -- https://github.com/akinsho/toggleterm.nvim
    {
        "akinsho/toggleterm.nvim",
        lazy = false,
        version = "*",
        opts = opts,
    }
}
