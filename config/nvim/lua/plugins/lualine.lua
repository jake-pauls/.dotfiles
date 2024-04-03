local opts = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = "",
    section_separators = "",
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
      {
          "mode",
          left_padding = 1,
          color = { gui = "bold" },
      },
    },
    lualine_b = {
        {
            "filetype",
            colored = false,
            icon_only = true,
            right_padding = 2,
            color = { gui = "italic" },
        },
        {
            "filename",
            file_status = false,
            newfile_status = false,
            path = 3,
            shorting_target = 30,
            symbols = {
                modified = "+",
                readonly = "-",
                unnamed  = "",
                newfile  = "*",
            },
        },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
        {
            "selectioncount",
            color = { gui = "bold", },
            padding = 1,
        },
    },
    lualine_z = {
        {
            "diff",
            color = { gui = "bold", },
            colored = false,
        },
        "branch",
    },
  },
  inactive_sections = {
        lualine_a = {
            {
                "filename",
                file_status = false,
                newfile_status = false,
                path = 0,
                shorting_target = 10,
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

return {
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = opts,
    }
}
