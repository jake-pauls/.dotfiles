" Set Color Overrides
fun! WeDoItForTheMakers()
    if has('termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    endif

    set background=dark

	let g:nord_contrast = v:true
	let g:nord_borders = v:true
	let g:nord_disable_background = v:false
	let g:nord_italic = v:true
	let g:nord_uniform_diff_background = v:true
	let g:nord_bold = v:true
	colorscheme nord

    hi Normal ctermbg=none guibg=none
    hi NonText ctermbg=none guibg=none
    hi EndOfBuffer ctermfg=2021
    hi LineNr guifg=#918175
    hi TelescopeBorder guifg=#5eacd
endfun
call WeDoItForTheMakers()

nnoremap <leader>wdiftm :call WeDoItForTheMakers()<CR>
