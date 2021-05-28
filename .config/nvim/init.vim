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

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Statusline
Plug 'itchyny/lightline.vim'

" Tabline
Plug 'romgrk/barbar.nvim'

" Git
Plug 'tpope/vim-fugitive'

" Commenting
Plug 'tpope/vim-commentary'

" Theming
Plug 'joshdick/onedark.vim'
Plug 'romgrk/doom-one.vim'

" C/C++ Syntax Highlighting
Plug 'bfrg/vim-cpp-modern'

call plug#end()

let mapleader = " "

""
"" Lua
""

" Compe (autocompletion, diagnostics, etc.)
luafile ~/.config/nvim/plugin/_compe.lua

" Language Servers
luafile ~/.config/nvim/plugin/lsp/_clangd.lua
luafile ~/.config/nvim/plugin/lsp/_ts.lua
luafile ~/.config/nvim/plugin/lsp/_go.lua
luafile ~/.config/nvim/plugin/lsp/_python.lua
luafile ~/.config/nvim/plugin/lsp/_bash.lua

""
"" Utils
""

" Trim whitespace after saving files
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup CodeQuality
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
