local opts = {
    ignored_filetypes = {
        "nofile",
        "quickfix",
        "prompt",
    },
    ignored_buftypes = {
        "NvimTree",
    },
    default_amount = 2,
    at_edge = "wrap",
    move_cursor_same_row = false,
    cursor_follows_swapped_bufs = false,
    ignored_events = {
        "BufEnter",
        "WinEnter",
    },
}

local keys = {
    {
        "<A-h>",
        function()
            require("smart-splits").resize_left()
        end,
        desc = "base: Resize Splits Left",
    },
    {
        "<A-j>",
        function()
            require("smart-splits").resize_down()
        end,
        desc = "base: Resize Splits Down",
    },
    {
        "<A-k>",
        function()
            require("smart-splits").resize_up()
        end,
        desc = "base: Resize Splits Up",
    },
    {
        "<A-l>",
        function()
            require("smart-splits").resize_right()
        end,
        desc = "base: Resize Splits Right",
    }
}

return {
    -- https://github.com/mrjones2014/smart-splits.nvim
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        opts = opts,
        keys = keys,
    }
}
