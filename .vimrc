set number
set tabstop=4
syntax on
set hls

" jump to the last position when reopening a file
" From /etc/vimrc
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
endif
