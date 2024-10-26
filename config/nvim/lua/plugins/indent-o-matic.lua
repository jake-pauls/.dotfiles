local config = function()
    local opts = {
        max_lines = 2048,
        standard_widths = { 2, 4, 8 },
        skip_multiline = true,
    }
    require("indent-o-matic").setup(opts)
end

return {
    -- https://github.com/Darazaki/indent-o-matic
    {
        "Darazaki/indent-o-matic",
        lazy = false,
        config = config,
    }
}
