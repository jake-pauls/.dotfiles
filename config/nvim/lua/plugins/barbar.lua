local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
}

local init = function()
    vim.g.barbar_auto_setup = false
end

local keys = {
    -- Basics
    {
        "<A-,>",
        "<cmd>BufferPrevious<CR>",
        desc = "base: Previous Buffer (BarBar)",
    },
    {
        "<A-.>",
        "<cmd>BufferNext<CR>",
        desc = "base: Next Buffer (BarBar)",
    },
    {
        "<A-q>",
        "<cmd>BufferClose<CR>",
        desc = "base: Close Buffer (BarBar)",
    },
    -- Re-Ordering Buffers
    {
        "<A-<>",
        "<cmd>BufferMovePrevious<CR>",
        desc = "base: Move Previous Buffer (BarBar)",
    },
    {
        "<A->>",
        "<cmd>BufferMoveNext<CR>",
        desc = "base: Move Next Buffer (BarBar)",
    },
    -- Goto Buffer in Position
    {
        "<A-1>",
        "<cmd>BufferGoto 1<CR>",
        desc = "base: Goto Buffer 1 (BarBar)",
    },
    {
        "<A-2>",
        "<cmd>BufferGoto 2<CR>",
        desc = "base: Goto Buffer 2 (BarBar)",
    },
    {
        "<A-3>",
        "<cmd>BufferGoto 3<CR>",
        desc = "base: Goto Buffer 3 (BarBar)",
    },
    {
        "<A-4>",
        "<cmd>BufferGoto 4<CR>",
        desc = "base: Goto Buffer 4 (BarBar)",
    },
    {
        "<A-5>",
        "<cmd>BufferGoto 5<CR>",
        desc = "base: Goto Buffer 5 (BarBar)",
    },
    {
        "<A-6>",
        "<cmd>BufferGoto 6<CR>",
        desc = "base: Goto Buffer 6 (BarBar)",
    },
    {
        "<A-7>",
        "<cmd>BufferGoto 7<CR>",
        desc = "base: Goto Buffer 7 (BarBar)",
    },
    {
        "<A-8>",
        "<cmd>BufferGoto 8<CR>",
        desc = "base: Goto Buffer 8 (BarBar)",
    },
    {
        "<A-9>",
        "<cmd>BufferGoto 9<CR>",
        desc = "base: Goto Buffer 9 (BarBar)",
    },
    {
        "<A-0>",
        "<cmd>BufferLast<CR>",
        desc = "base: Goto Last Buffer (BarBar)",
    },
}

local opts = {
    animation = false,
    auto_hide = 1, -- Hide the top bar when less than one buffer is open
    clickable = false,
    hide = {
        extensions = false,
        inactive = false,
    },
    maximum_padding = 4,
    minimum_padding = 1,
    no_name_title = nil,
}

return {
    -- https://github.com/romgrk/barbar.nvim
    {
        "romgrk/barbar.nvim",
        lazy = false,
        version = false,
        dependencies = dependencies,
        init = init,
        keys = keys,
        opts = opts,
    },
}
