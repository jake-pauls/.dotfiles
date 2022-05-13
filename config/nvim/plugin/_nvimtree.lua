require'nvim-tree'.setup {
  sort_by             = "name",
  disable_netrw       = false,
  hijack_netrw        = false,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  sort_by             = "name",
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
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
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 25,
    height = 25,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
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
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
