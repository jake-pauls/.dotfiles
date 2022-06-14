""
"" Project Navigation
""

" Project Find
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<CR>

" Project Search
nnoremap <leader>ps <cmd>lua require('telescope.builtin').live_grep({ search = vim.fn.expand("<cword>")})<CR>

" Project Word
nnoremap <leader>pw <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>

" Project Git Commits
nnoremap <leader>pgc <cmd>lua require('telescope.builtin').git_commits()<CR>

" Project Git Status
nnoremap <leader>pgs <cmd>lua require('telescope.builtin').git_status()<CR>

""
"" Buffer Navigation
""

" Buffer Fuzzy Find
nnoremap <leader>bff <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>

" Buffer Git Commits
nnoremap <leader>bgc <cmd>lua require('telescope.builtin').git_bcommits()<CR>

" Spelling
nnoremap <leader>bs <cmd>lua require('telescope.builtin').spell_suggest()<CR>

""
"" LSP
""

" Implementations
nnoremap <leader>gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>

" Diagnostics
nnoremap <leader>gdg <cmd>lua require('telescope.builtin').diagnostics()<CR>

""
"" Huh
""

" Planets
nnoremap <leader>telescope <cmd>lua require('telescope.builtin').planets()<CR>

