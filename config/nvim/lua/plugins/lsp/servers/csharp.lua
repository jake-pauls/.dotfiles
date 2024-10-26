local M = {}

function M.setup()
    require("lspconfig").omnisharp.setup({})
end

return M
