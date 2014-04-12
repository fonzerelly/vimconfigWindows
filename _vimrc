set nocompatible
source $VIMRUNTIME/vimrc_example.vim

"Added for Mac"
set guifont=Courier:h18

"Manually added"
set number
set nowrap
set smartcase
set incsearch
autocmd BufWritePre * :%s/\s\+$//e

"Set PASTE-Keymapping"
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set tabstop=4
set shiftwidth=4
set expandtab 
set noautoindent

let g:xml_syntax_folding=1
let g:javaScript_fold=0
au FileType xml setlocal foldmethod=syntax
execute pathogen#infect()
syntax on
"filetype plugin indent on
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['vim'] }
let g:syntastic_javascript_checkers = ['jslint4java']
let g:syntastic_always_populate_loc_list = 1
let mapleader = "-"
let maplocalleader = "+"
"move line downwards
noremap <Leader>- ddp
"move line upwards
noremap <Leader>_ ddkP
"Uppercase word
inoremap <Leader><c-u> <esc>viwUi
nnoremap <Leader><c-u> <esc>viwU
"Lowercase word
inoremap <Leader><c-l> <esc>viwui
nnoremap <Leader><c-l> <esc>viwu
"edit vimrc
noremap <leader>ev :tabnew $MYVIMRC<cr>
"load vimrc
noremap <leader>sv :source $MYVIMRC<cr>
"load file specified in doublequotes
noremap <leader>o yi"<cr> :tabnew <c-r>"<cr>
"follow link in help
nnoremap <leader>f <c-]>
nnoremap <leader>b <c-t>
"include currentword in doublequotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>" <esc>`>i"<esc>`<i"<esc>`>
"work with svn
nnoremap <leader>revert :w %.reverted<cr> :!svn revert %<cr>
nnoremap <leader>restore :!copy /Y %.reverted %<cr> :!del %.reverted<cr>
nnoremap <leader>state :echo filereadable(expand("%").".reverted")<cr>
"switch to javascript
nnoremap <leader>js :setf javascript<cr>
nnoremap <leader>xml :setf xml<cr>
"improve Escape-Switching
inoremap kj <esc>
inoremap jk <esc>
"inoremap <esc> <nop>
vnoremap kj <esc>
vnoremap jk <esc>
"vnoremap <esc> <nop>
"modify .logfiles to keep only time outputs
nnoremap <localleader>result :%s/^.* - //<cr> :%s/^\(.*ran for\)/§\1/g<cr> :g/^[^§]/d<cr> :%s/\D//g<cr> :nohlsearch<cr>
"delete whole file
nnoremap <Leader>cl ggVGd<cr>
"expand whole file
nnoremap <Leader>ex ggVGzO<cr>
"removing arrow keys to stick to hjkl
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
"filetype related commenting
:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType javascript nnoremap <buffer> <localleader>C $F/F/2x
:autocmd FileType javascript iabbrev def function
:autocmd FileType javascript iabbrev ret return
:autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
:autocmd FileType python     nnoremap <buffer> <localleader>C F#x
:autocmd FileType xml        nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
nnoremap <Leader>n :cnext<cr>
nnoremap <Leader>N :cprev<cr>
nnoremap <Leader>r "qdt,dwep"qp
