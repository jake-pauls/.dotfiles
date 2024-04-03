local set = vim.opt
local sysname = vim.loop.os_uname().sysname

-- Numbers
set.number = true
set.relativenumber = false

-- Indentation
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.linespace = 0
set.expandtab = true
set.smartindent = true

-- Navigation
set.hlsearch = false
set.incsearch = true
set.ignorecase = false
set.wrap = false
set.scrolloff = 2
set.sidescroll = 2

-- Artifacts
set.swapfile = false
set.backup = false
set.undofile = true

if sysname == "Windows_NT" then
    set.undodir = os.getenv("UserProfile") .. "\\.nvim\\undodir"
else
    set.undodir = os.getenv("HOME") .. "/.nvim/undodir"
end

-- Colors
set.termguicolors = true

-- Ignore
set.wildignore = set.wildignore + "*.o, *.obj, *.rej, *.so, *.dll, *.a, *.lib"

-- Misc.
set.encoding = "utf8"
set.errorbells = false
set.signcolumn = "no"
set.conceallevel = 0
set.cmdheight = 1
set.hidden = true
set.lazyredraw = true
set.completeopt = "menuone,noinsert,noselect"
set.backspace = "indent,start,eol"
