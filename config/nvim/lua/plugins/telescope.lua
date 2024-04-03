local fn = vim.fn
local loop = vim.loop

local dependencies = {
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = fn.executable("make") == 1,
    },
    {
        "Verf/telescope-everything.nvim",
        enabled = loop.os_uname().sysname == "Windows_NT",
        init = function()
            require("telescope").load_extension("everything")
        end,
    },
}

-- Executes the passed function if a '.git' directory exists in the current working directory
-- Will log an error message if no git directory is present
local function with_git_dir(fun)
    local path = loop.cwd() .. "/.git"
    local ok, err = loop.fs_stat(path)
    if ok then
        fun()
    else
        print(err)
    end
end

local keys = {
    -- Help
    {
        "<leader>hh",
        function()
            require("telescope.builtin").help_tags()
        end,
        desc = "base: Help Tags (Telescope)",
    },
    {
        "<leader>hk",
        function()
            require("telescope.builtin").keymaps()
        end,
        desc = "base: Keymaps (Telescope)",
    },
    -- Project
    {
        "<leader>pf",
        function()
            require("telescope.builtin").find_files()
        end,
        desc = "base: Project Find Files (Telescope)",
    },
    {
        "<leader>ps",
        function()
            require("telescope.builtin").live_grep()
        end,
        desc = "base: Project Search (Telescope)",
    },
    {
        "<leader>pw",
        function()
            require("telescope.builtin").grep_string({ search = fn.expand("<cword>") })
        end,
        desc = "base: Project Search Current Word (Telescope)",
    },
    {
        "<leader>of",
        function()
            require("telescope.builtin").oldfiles()
        end,
        desc = "base: Old Files (Telescope)",
    },
    -- Git
    {
        "<leader>gc",
        function()
            local telescope_git_commits = function()
                require("telescope.builtin").git_commits()
            end
            with_git_dir(telescope_git_commits)
        end,
        desc = "base: Git Commits (Telescope)",
    },
    {
        "<leader>gs",
        function()
            local telescope_git_status = function()
                require("telescope.builtin").git_status()
            end
            with_git_dir(telescope_git_status)
        end,
        desc = "base: Git Status (Telescope)",
    },
    -- Buffer
    {
        "<leader>bff",
        function()
            require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "base: Buffer Fuzzy Find (Telescope)",
    },
    {
        "<leader>bgc",
        function()
            local telescope_git_buffer_commits = function()
                require("telescope.builtin").git_bcommits()
            end
            with_git_dir(telescope_git_buffer_commits)
        end,
        desc = "base: Buffer Git Commits (Telescope)",
    },
    -- Everything (Windows Only)
    {
        "<leader>es",
        function()
            require("telescope").extensions.everything.everything()
        end,
        desc = "base: Everything Search (Telescope - Windows Only)",
    },
}

local opts = {
    defaults = {
        file_ignore_patterns = {
            "^node_modules/",
            "^venv/",
            "^__pycache__/",
            "%.o",
            "%.obj",
        },
        layout_strategy = "horizontal",
        layout_config   = {
            bottom_pane = {
                height = 0.85,
                preview_cutoff = 100,
                prompt_position = "bottom"
            },
            center = {
                height = 0.75,
                preview_cutoff = 0,
                prompt_position = "bottom",
                width = 0.65
            },
            cursor = {
                height = 0.45,
                preview_cutoff = 45,
                width = 0.5
            },
            horizontal = {
                height = 0.9,
                preview_cutoff = 100,
                prompt_position = "bottom",
                width = 0.9,
            },
            vertical = {
                height = 0.85,
                preview_cutoff = 0,
                prompt_position = "bottom",
                width = 0.85,
            },
        },
    },
}

return {
    -- https://github.com/nvim-telescope/telescope.nvim
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        version = false,
        dependencies = dependencies,
        keys = keys,
        opts = opts,
    },
}
