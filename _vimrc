set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

if (exists('*MyDiff')== 0)
    set diffexpr=MyDiff()
    function MyDiff()
      let opt = '-a --binary '
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
      let arg1 = v:fname_in
      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
      let arg2 = v:fname_new
      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
      let arg3 = v:fname_out
      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
      let eq = ''
      if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
          let cmd = '""' . $VIMRUNTIME . '\diff"'
          let eq = '"'
        else
          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
      else
        let cmd = $VIMRUNTIME . '\diff'
      endif
      execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

"Manually added"
set number
set nowrap
set smartcase
set incsearch
"Set PASTE-Keymapping"
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set tabstop=4
set shiftwidth=4
set expandtab 
set autoindent

let g:xml_syntax_folding=1
let g:javaScript_fold=0
au FileType xml setlocal foldmethod=syntax
execute pathogen#infect()
syntax on
filetype plugin indent on
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['vim'] }
let g:syntastic_javascript_checkers = ['jslint4java']
let g:syntastic_always_populate_loc_list = 1
let mapleader = "-"
let maplocalleader = "_"
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
noremap <leader>ev :split $MYVIMRC<cr>
"load vimrc
noremap <leader>sv :source $MYVIMRC<cr>
"load file specified in doublequotes
noremap <leader>o yi"<cr> :tabnew <c-r>"<cr>
"follow link in help
nnoremap <leader>f <c-]>
nnoremap <leader>revert :w %.reverted<cr> :!svn revert %<cr>
nnoremap <leader>restore :!copy /Y %.reverted %<cr> :!del %.reverted<cr>
nnoremap <leader>state :echo filereadable(expand("%").".reverted")<cr>
