" Set Color Overrides
fun! WeDoItForTheMakers()
    if exists("+termguicolors")
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif

    set background=dark
    colorscheme srcery

    highlight Normal guibg=none
    highlight LineNr guifg=#2c78bf
    hi TelescopeBorder guifg=#5eacd
endfun
call WeDoItForTheMakers()

nnoremap <leader>wdiftm :call WeDoItForTheMakers()<CR>
