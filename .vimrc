set number
set tabstop=4
syntax on
map <F12> :call SwitchDarkMode()<CR>

let g:lightscheme = 'shine'
let g:darkscheme = 'evening'
let g:scheme_file = '/tmp/.vimscheme'
try
	exe 'colorscheme ' . trim(readfile(g:scheme_file)[0])
catch /.*/
	exe 'colorscheme ' . g:darkscheme
endtry

" Switch between light color scheme and dark scheme
func SwitchDarkMode()
	if filereadable(g:scheme_file)
		let l:cur_scheme = trim(readfile(g:scheme_file)[0])
	else
		let l:cur_scheme = g:darkscheme
	endif

	if l:cur_scheme == g:lightscheme
		let l:new_scheme = g:darkscheme
	elseif l:cur_scheme == g:darkscheme
		let l:new_scheme = g:lightscheme
	else
		let l:new_scheme = g:darkscheme
	endif

	exe 'colorscheme ' . l:new_scheme
	call writefile([l:new_scheme], g:scheme_file)
endfunc
