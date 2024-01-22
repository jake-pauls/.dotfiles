local ts_opts = {
    highlight = { enable = true, },
    indent = { enable = true, },
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "c_sharp",
        "go",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
    },
    sync_install = false,
    auto_install = true,
}

local ts_config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
            if added[lang] then
                return false
            end
            added[lang] = true
            return true
        end, opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)
end

return {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        event = "VeryLazy",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = ts_opts,
        config = ts_config,
    },
}
