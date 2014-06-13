set nocompatible
source $VIMRUNTIME/vimrc_example.vim

"Added for Mac"
set guifont=Courier:h18

"Manually added"
set number
set nowrap
set smartcase
set incsearch
augroup every_file
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

"Set PASTE-Keymapping"
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"Specify indentation
augroup filtype_ruby
  autocmd!
  autocmd FileType ruby set tabstop=2
  autocmd FileType ruby set shiftwidth=2
  autocmd FileType ruby set softtabstop=2
  autocmd FileType ruby set expandtab
  autocmd FileType ruby set smartindent
  autocmd FileType ruby :echom "Indentation set to Ruby"
augroup END
"
augroup filtype_php
  autocmd!
  autocmd FileType php set tabstop=4
  autocmd FileType php set shiftwidth=4
  autocmd FileType php set softtabstop=4
  autocmd FileType php set noexpandtab
  autocmd FileType php set smartindent
  autocmd FileType php :echom "Indentation set to PHP"
augroup END

augroup filtype_js
  autocmd!
  autocmd FileType javascript set tabstop=4
  autocmd FileType javascript set shiftwidth=4
  autocmd FileType javascript set softtabstop=4
  autocmd FileType javascript set expandtab
  autocmd FileType javascript set smartindent
  autocmd FileType javascript :echom "Indentation set to JavaScript"
augroup END

"Find tags file
set tags=./tags,tags;$HOME
noremap <leader>tg :!ctags -R -f ~/tags ~<cr>

execute pathogen#infect()
syntax on
"filetype plugin indent on
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['vim'] }
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors=1
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
"follow link in help or tags
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

"handle Command-Key of Mac
nnoremap <D-8> [
nnoremap <D-9> ]
inoremap <D-8> [
inoremap <D-9> ]
cnoremap <D-8> [
cnoremap <D-9> ]


nnoremap <Leader>n :cnext<cr>
nnoremap <Leader>N :cprev<cr>
nnoremap <Leader>r "qdt,dwep"qp
nnoremap <Leader>x :Explore<cr>

"fugitive Helpers
nnoremap <Leader>d :tabnew %<cr> :tabmove -1<cr> :Gdiff<cr>
nnoremap <Leader>D :tabclose<cr>
