set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'mustache/vim-mustache-handlebars'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
set fdm=indent
set tw=79
set foldlevel=2
set noswapfile
autocmd BufWritePre * %s/\s\+$//e
