require'nvim-tree'.setup {
  auto_reload_on_write = true,
  sort_by              = "name",
  disable_netrw        = true,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_ft_on_setup   = {},
  sort_by              = "name",
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = true,
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {
      '.git',
      'node_modules',
      '.cache'
    }
  },
  git = {
    enable  = true,
    ignore  = false,
    timeout = 500,
  },
  view = {
    width = 25,
    height = 25,
    hide_root_folder = false,
    side = 'left',
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  actions = {
    use_system_clipboard = true,
    open_file = {
      quit_on_open = false,
      resize_window = false,
    },
  },
  renderer = {
	add_trailing = false,
	highlight_git = true,
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
	  inline_arrows = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
	  }
    },
	icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
        arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
	},
	special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "Dockerfile", "premake5.lua", "CMakeLists.txt" },
	symlink_destination = true,
  },
  diagnostics = {
    icons = {
	  hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
