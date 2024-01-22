local config = function()
    local opts = {
        theme = "doom",
        disable_move = false,
        shortcut_type = "letter",
        change_to_vcs_root = false,
        config = {
            header = {
                "⠀⠀    ⠀⠀                       ",
                "⠀⠀    ⠀⠀                       ",
                "⠀⠀    ⠀⠀                       ",
                "⠀⠀    ⠀⠀                       ",
                "⠀⠀⠀     ⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀      ",
                "⠀⠀    ⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀     ",
                "⠀    ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀     ",
                "⠀   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀    ",
                "⠀   ⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀    ",
                "⠀   ⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀    ",
                "⠀    ⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀     ⠀",
                "⠀⠀    ⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⠀⠀     ",
                "⠀⠀    ⠀⠀                       ",
                "⠀⠀    ⠀⠀                       ",
                "⠀⠀    ⠀⠀                       ",
                "⠀⠀    ⠀⠀                       ",
            },
            center = {
                {
                    icon = "↯  ",
                    icon_hl = "Title",
                    desc = "Update packages",
                    desc_hl = "String",
                    key = "u",
                    keymap = "SPC L U",
                    key_hl = "Number",
                    key_format = " %s",
                    action = "Lazy update",
                },
                {
                    icon = "⏲  ",
                    icon_hl = "Title",
                    desc = "Recent files",
                    desc_hl = "String",
                    key = "r",
                    keymap = "SPC O F",
                    key_hl = "Number",
                    key_format = " %s",
                    action = "lua require(\"telescope.builtin\").oldfiles()",
                },
                {
                    icon = "🔍 ",
                    icon_hl = "Title",
                    desc = "Find files",
                    desc_hl = "String",
                    key = "f",
                    keymap = "SPC P F",
                    key_hl = "Number",
                    key_format = " %s",
                    action = "lua require(\"telescope.builtin\").find_files()",
                },
                {
                    icon = "🕮  ",
                    icon_hl = "Title",
                    desc = "Find word",
                    desc_hl = "String",
                    key = "w",
                    keymap = "SPC P S",
                    key_hl = "Number",
                    key_format = " %s",
                    action = "lua require(\"telescope.builtin\").live_grep()",
                },
                {
                    icon = "🛈  ",
                    icon_hl = "Title",
                    desc = "Help",
                    desc_hl = "String",
                    key = "h",
                    keymap = "SPC H H",
                    key_hl = "Number",
                    key_format = " %s",
                    action = "lua require(\"telescope.builtin\").help_tags()",
                },
            },
            footer = {},
        },
        hide = {
            statusline = true,
            tabline = true,
            winbar = true,
        },
    }
    require("dashboard").setup(opts)
end

local dependencies = {
    { "nvim-tree/nvim-web-devicons" },
}

return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = config,
        dependencies = dependencies,
    }
}
