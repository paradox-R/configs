call plug#begin('~/.vim/plugged')
	Plug 'joshdick/onedark.vim'
	Plug 'ap/vim-css-color'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
call plug#end()            

filetype plugin indent on   
syntax on
set autoread
set wildmenu
"set ruler rulerformat=%15(%c%V\ %p%%%)
set number relativenumber
set colorcolumn=110
highlight ColorColumn ctermbg=grey
set encoding=UTF-8
set splitright splitbelow 
set tabstop=4 softtabstop=4 shiftwidth=4
set smartcase
set autoindent
set spelllang=en
set spell
highlight clear SpellBad
highlight SpellBad cterm=underline
set hlsearch is
highlight Search ctermfg=black ctermbg=grey
set laststatus=2
set cmdheight=1
set cursorline
set backspace=indent,eol,start
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

runtime macros/matchit.vim

colorscheme onedark

let g:currentmode={
       \ 'n'  : 'Normal ',
       \ 'v'  : 'Visual ',
       \ 'V'  : 'V·Line ',
       \ ''   : 'V·Block ',
       \ 'i'  : 'Insert ',
       \ 'R'  : 'Replace ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

set statusline=
set statusline+=%02n\ ❯
set statusline+=\ %{toupper(g:currentmode[mode()])}❯
set statusline+=\ %t								"tail of the filename
set statusline+=%{&modified?'\ [+]':''}\ 				"modified flag
set statusline+=%{&readonly?'\ [RO]\ ':''}			"read only flag
set statusline+=%<
set statusline+=%=									"left/right separator
set statusline+=%{&ff}\ 							"file format
set statusline+=[%{strlen(&fenc)?&fenc:'none'}]\ 	"file encoding
set statusline+=%y\ 								"filetype
set statusline+=❮\ Ln\ %02l\ Col\ %02c				"Line iNum, Cursor Column
set statusline+=\ \ %L\ 並%P						"total lines /Percent through file

set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"mappings
let mapleader=" "

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader><Space> :let @/=''<CR>
nnoremap <Leader><left> :vertical resize -5<CR>
nnoremap <Leader><right> :vertical resize +5<CR>
"Split Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"Tab Navigation
nnoremap <S-l> :tabprevious<CR>
nnoremap <S-h> :tabnext<CR>
"Buffer Navigation
nnoremap <Leader>l :bnext<CR>
nnoremap <Leader>h :bprev<CR>

