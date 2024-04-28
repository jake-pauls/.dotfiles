local opts = {
    disable_filetype = {
        "TelescopePrompt",
        "NvimTree",
        "vim"
    },
    disable_in_macro = true,
    disable_in_visualblock = false,
    disable_in_replace_mode = false,
}

return {
    -- https://github.com/windwp/nvim-autopairs
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = opts,
}
