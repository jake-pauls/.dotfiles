require("base.global")
require("base.cmd")
require("base.set")
require("base.remap")
require("base.lazy")

if vim.g.neovide then
    require("base.neovide")
end