" Jake Pauls
" https://jacobpauls.dev
" https://github.com/jacob-pauls

""
"" General Sets
""

" Tabbing and Indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Line Numbers
set relativenumber
set nu

" History
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Navigation
set scrolloff=8
set nohlsearch
set incsearch

" Misc.
set exrc
set guicursor=
set noshowmode
set completeopt=menuone,noinsert,noselect
set hidden
set noerrorbells
set nowrap
set signcolumn=yes

""
"" Plug
""
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

""
"" Remaps
""
let mapleader = " "
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

""
"" Autos
""
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup EDITS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
