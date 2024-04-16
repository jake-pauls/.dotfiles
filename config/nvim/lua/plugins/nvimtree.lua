local opts = {
    sort = {
        sorter = "case_sensitive",
    },
    renderer = {
        add_trailing = false,
        group_empty = true,
        indent_width = 2,
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", ".gitignore", "premake5.lua", "CMakeLists.txt", },
        highlight_git = "none",
        highlight_diagnostics = "none",
        highlight_opened_files = "none",
        highlight_modified = "none",
        highlight_bookmarks = "none",
        highlight_clipboard = "name",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = false,
                modified = false,
                diagnostics = true,
                bookmarks = false,
            },
        },
    },
    filters = {
        git_ignored = false,
    },
    live_filter = {
        prefix = "~> ",
        always_show_folders = false,
    },
}

local config = function()
    require("nvim-tree").setup(opts)
end

local keys = {
    {
        "<C-n>",
        function()
            require("nvim-tree.api").tree.toggle()
        end,
        desc = "base: Toggle File Tree",
    },
    {
        "<C-r>",
        function()
            require("nvim-tree.api").tree.reload()
        end,
        desc = "base: Refresh File Tree",
    },
    {
        "<C-y>",
        function()
            require("nvim-tree.api").copy_absolute_path()
        end,
        desc = "base: Copy Absolute Path from File Tree",
    },
}

return {
    -- https://github.com/nvim-tree/nvim-tree.lua
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        opts = opts,
        config = config,
        keys = keys,
    }
}
