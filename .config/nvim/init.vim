" Jake Pauls
" https://jacobpauls.dev
" https://github.com/jacob-pauls

""
"" Plug
""
call plug#begin('~/.vim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Icons (Fern)
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

" Tree
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

Plug 'morhetz/gruvbox'
call plug#end()

let mapleader = " "

""
"" Utils
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
