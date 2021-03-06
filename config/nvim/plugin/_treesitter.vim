" Treesitter
" TODO: Break these plugins into lua files...
lua <<EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {
            "c",
            "cpp",
            "c_sharp",
            "go",
            "rust",
            "html",
            "css",
            "lua",
            "python",
            "javascript",
            "typescript",
            "tsx",
            "vue",
            "graphql",
            "toml",
            "yaml",
            "jsonc",
            "lua",
        },

        highlight = {
            enable = true,
        },

        indent = {
            enable = true,
        },

        autotag = {
            enable = true,
        },

        playground  = {
            enable = true,
        },
    }
EOF
