set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'gcorne/vim-sass-lint'
"show git diffs of the file in the file
Plugin 'mhinz/vim-signify'
"ctrl+p fuzzy search of files
Plugin 'ctrlpvim/ctrlp.vim'
"Visual marks
Plugin 'kshenoy/vim-signature'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Fugitive. Set horizontal split by def
set diffopt+=vertical
set number
syntax on
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
set autoindent
" set clipboard=unnamed
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,p,main"
set scrolloff=10 "set 10 lines after searching
set fdm=indent
set tw=79
set foldlevel=2
set noswapfile
set directory=~/.vim/swps
autocmd BufWritePre * %s/\s\+$//e
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
"Shows the current file. Used by vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 "show buffers
"Hides stuff that are shown with vim-airline instead
set noshowmode
let s:hidden_all = 1
set noruler
set noshowcmd
"------------
"Syntastic
let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scss_checkers  = ['sasslint']
"Ctrlp - set controls to search files. ctrl + j / k to move up down etc.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
