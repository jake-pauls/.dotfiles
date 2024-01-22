-- Options for lspkind to interface with nvim-cmp
local cmp_format = {
    mode = "symbol_text",
    preset = "codicons",
    maxwidth = 50,
    ellipsis_char = "...",
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    show_labelDetails = false,
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 1000,
    max_kind_width = 1000,
    max_menu_width = 100000,
    documentation = true,
    before = function(_, vim_item)
        return vim_item
    end,
    source = {
        path = true,
        buffer = true,
        calc = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        tags = true,
        snippets_nvim = true,
        treesitter = true,
    },
}

local function config()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    local opts = {
        snippet = {
            expand = function(args)
                -- Use vsnip as the snippet engine
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "vsnip" },
        }, {
            { name = "buffer" },
        }),
        formatting = {
            format = lspkind.cmp_format(cmp_format),
        },
    }

    cmp.setup(opts)

    cmp.setup.cmdline({ "/", "?", }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer", },
        },
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path", },
        }, {
            { name = "cmdline", },
        })
    })
end

return {
    -- https://github.com/hrsh7th/nvim-cmp
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "hrsh7th/cmp-path",
    },
    {
        "hrsh7th/cmp-cmdline",
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        event = { "InsertEnter", "CmdlineEnter", },
        config = config,
    },
    -- vsnip support
    {
        "hrsh7th/cmp-vsnip",
    },
    {
        "hrsh7th/vim-vsnip",
    },
}
