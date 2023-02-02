" Remap default mapping from <leader>p
nnoremap <leader>pt <Plug>(Prettier)

" Auto format files without '@prettier' decorator
let g:prettier#autoformat_require_pragma = 0

" Enable auto formatting only for files with a config
let g:prettier#autoformat_config_present = 0

" Let a config file override prettier settings
let g:prettier#config#config_precedence = 'prefer-file'

" Execute Prettier async
let g:prettier#exec_cmd_async = 1
