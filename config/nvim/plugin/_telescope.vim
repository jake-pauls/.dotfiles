" Project Navigation
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For: ")})<CR>
nnoremap <leader>pw <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>
