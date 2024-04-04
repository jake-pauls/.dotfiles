local set = vim.opt
local platform = vim.loop.os_uname().sysname

if platform == "Windows_NT" then
    set.undodir = os.getenv("UserProfile") .. "\\.nvim\\undodir"
elseif platform == "Linux" or platform == "Darwin" then
    set.undodir = os.getenv("HOME") .. "/.nvim/undodir"
    set.shell = "/usr/bin/zsh"
end