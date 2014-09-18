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


if has("autocmd")
  filetype on

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

  augroup filtype_php
    autocmd!
    autocmd FileType php set tabstop=4
    autocmd FileType php set shiftwidth=4
    autocmd FileType php set softtabstop=4
    autocmd FileType php set noexpandtab
    autocmd FileType php set smartindent
    autocmd FileType php :echom "Indentation set to PHP"
  augroup END

  augroup filtype_javascript
    autocmd!
    autocmd FileType javascript set tabstop=2
    autocmd FileType javascript set shiftwidth=2
    autocmd FileType javascript set softtabstop=2
    autocmd FileType javascript set expandtab
    autocmd FileType javascript set smartindent
    autocmd FileType javascript :echom "Indentation set to JavaScript"
  augroup END

  augroup filetype_vimdeck
    autocmd!
    autocmd BufNewFile,BufRead *.vimdeck setfiletype markdown

    autocmd FileType vimdeck set tabstop=4
    autocmd FileType vimdeck set shiftwidth=4
    autocmd FileType vimdeck set softtabstop=4
    autocmd FileType vimdeck set expandtab
    autocmd FileType vimdeck set smartindent
    autocmd FileType vimdeck :echom "Vimdeck is a markdown variant"
  augroup END

  augroup filetype_rabl
    autocmd!
    autocmd BufNewFile,BufRead *.rabl setfiletype ruby
    autocmd FileType ruby :echom "Indentation set to Ruby"
  augroup END

  augroup filetype_cucumber
    autocmd!
    autocmd FileType cucumber set tabstop=2
    autocmd FileType cucumber set shiftwidth=2
    autocmd FileType cucumber set softtabstop=2
    autocmd FileType cucumber set expandtab
    autocmd FileType cucumber set smartindent
    autocmd FileType cucumber :echom "Indentation set to Cucumber"
  augroup END

  augroup filetype_haskell
    autocmd!
    autocmd FileType haskell set tabstop=3
    autocmd FileType haskell set shiftwidth=3
    autocmd FileType haskell set softtabstop=3
    autocmd FileType haskell set expandtab
    autocmd FileType haskell set smartindent
    autocmd FileType haskell :echom "Indentation set to Haskell"
  augroup END

  augroup filetype_html
    autocmd!
    autocmd FileType html set tabstop=2
    autocmd FileType html set shiftwidth=2
    autocmd FileType html set softtabstop=2
    autocmd FileType html set expandtab
    autocmd FileType html set smartindent
    autocmd FileType html :echom "Indentation set to HTML"
  augroup END
endif

"folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=10    "deepest fold is 10 levels
set nofoldenable      "dont fold by default
set foldlevel=1

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
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
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
nnoremap <D-5> [
nnoremap <D-9> ]
nnoremap <D-6> ]
inoremap <D-8> [
inoremap <D-5> [
inoremap <D-9> ]
inoremap <D-6> ]
cnoremap <D-8> [
cnoremap <D-5> [
cnoremap <D-9> ]
cnoremap <D-6> ]



nnoremap <Leader>n :cnext<cr>
nnoremap <Leader>N :cprev<cr>
nnoremap <Leader>r "qdt,dwep"qp
nnoremap <Leader>x :Explore<cr>

"fugitive Helpers
nnoremap <Leader>d :tabnew %<cr> :tabmove -1<cr> :Gdiff<cr>
nnoremap <Leader>D :tabclose<cr>

nnoremap <leader>bn :bn<cr> :SyntasticCheck<cr>
