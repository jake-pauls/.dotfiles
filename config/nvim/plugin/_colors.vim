" Set Color Overrides
fun! WeDoItForTheMakers()
    if exists("termguicolors")
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

    if has('termguicolors')
      set termguicolors
    endif

    set background=dark
    let g:everforest_background = 'hard'
    colorscheme everforest

    hi Normal guibg=none
    hi LineNr guifg=#918175
    hi TelescopeBorder guifg=#5eacd
endfun
call WeDoItForTheMakers()

nnoremap <leader>wdiftm :call WeDoItForTheMakers()<CR>
