" Remap default mapping from <leader>p
nmap <leader>py <Plug>(Prettier)

" Auto format files without '@prettier' decorator
let g:prettier#autoformat_require_pragma = 0

" Enable auto formatting only for files with a config
let g:prettier#autoformat_config_present = 1

" Execute Prettier asyncronously
let g:prettier#exec_cmd_async = 1
