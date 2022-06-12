" Enable vimtex's syntax features
syntax enable

" View TeX'ed PDFs with zathura
let g:vimtex_view_method = 'zathura'

" Set vimtex's local leader
let maplocalleader = '\'

" Set the output directory to a build directory
let g:vimtex_compiler_latexmk = {'build_dir': 'pdf'}

