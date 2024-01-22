local g = vim.g
local opt = vim.opt
local fn = vim.fn

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print("Installing lazy.nvim....")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      path,
    })
  end
end

function lazy.setup(plugins)
  if g.plugins_ready then
    return
  end

  -- This line can be commented out once lazy is installed
  lazy.install(lazy.path)

  opt.rtp:prepend(lazy.path)

  require("lazy").setup(plugins, lazy.opts)
  g.plugins_ready = true
end

-- Lazy Setup (plugins/)
lazy.path = fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}
lazy.plugins =
lazy.setup("plugins")
