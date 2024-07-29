local M = {}

function M.setup()
    local lspconfig = require("lspconfig")
    lspconfig.zls.setup({
        cmd = { "/home/jake/.repos/zls/zig-out/bin/zls" },
        filetypes = { "zig" },
        root_dir = lspconfig.util.root_pattern("zls.json", "build.zig", ".git")
    })

    -- Global Settings for ZLS
    vim.g.zig_fmt_parse_errors = false
end

return M
