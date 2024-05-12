local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

local opts = {
    size = 20,
    open_mapping = [[<C-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shade_factor = 2,
    start_in_insert = true,
    direction = "float",
    close_on_exit = true,
    float_opts = {
        border = "single",
        winblend = 0,
    },
}

return {
    -- https://github.com/akinsho/toggleterm.nvim
    {
        "akinsho/toggleterm.nvim",
        lazy = false,
        version = "*",
        opts = opts,
    }
}
