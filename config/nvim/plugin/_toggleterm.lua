require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shade_factor = 2,
  start_in_insert = true,
  direction = 'float',
  close_on_exit = true,
  float_opts = {
    border = 'single',
    winblend = 0,
  }
}

