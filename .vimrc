set nocompatible              " be iMproved, required
" auto-reads and refreshes the file for the auto-fixing by eslint
" https://stackoverflow.com/questions/2157914/can-vim-monitor-realtime-changes-to-a-file
set autoread
au CursorHold * checktime
" ---
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-syntastic/syntastic'
Plugin 'gcorne/vim-sass-lint'
Plugin 'leafgarland/typescript-vim'
"show git diffs of the file in the file
Plugin 'mhinz/vim-signify'
"ctrl+p fuzzy search of files
Plugin 'ctrlpvim/ctrlp.vim'
"Visual marks
Plugin 'kshenoy/vim-signature'
"Visual colors
Plugin 'ap/vim-css-color'
"Searching a word from within vim
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'noahfrederick/vim-skeleton'
Plugin 'posva/vim-vue'
Plugin 'fatih/vim-go'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'w0rp/ale'
Plugin 'roxma/nvim-completion-manager' " Needs pip3 install --user neovim jedi psutil setproctitle afterwards
Plugin 'roxma/nvim-cm-tern', { 'do' : 'npm install' }
Plugin 'fgrsnau/ncm-otherbuf'
Plugin 'mhartington/nvim-typescript' " needs :UpdateRemotePlugins run once after installation
Plugin 'calebeby/ncm-css'
Plugin 'jiangmiao/auto-pairs'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Fugitive. Set horizontal split by def
set diffopt+=vertical
set number
syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
set autoindent
" E*--
set expandtab
"set noexpandtab
set listchars=tab:--,trail:~,extends:>,precedes:<
set list
" ----
" set clipboard=unnamed
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,p,main"
set scrolloff=10 "set 10 lines after searching
set fdm=indent
set tw=79
set foldlevel=1
set noswapfile
set directory=~/.vim/swps
autocmd BufWritePre * %s/\s\+$//e
"Shows the current file. Used by vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 "show buffers
"Hides stuff that are shown with vim-airline instead
set noshowmode
let s:hidden_all = 1
set noruler
set noshowcmd
"------------

"Syntastic -> trying out w0rp instead
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_scss_checkers  = ['sasslint']

" w0rp -
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
let g:ale_completion_enabled = 1

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Fix python 3 support for neovim, to enable plugins to do async stuff to vim
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python'

" Setup for the nvim completion manager
" don't give |ins-completion-menu| messages.  For example,
" '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<C-y>\<cr>" : "\<CR>")
inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" TS completion
" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1


"Ctrlp - set controls to search files. ctrl + j / k to move up down etc.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"easier navigation on the buffer tabs
nnoremap <silent> gb :bprev<CR>
nnoremap <silent> gn :bnext<CR>
"ack - use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"ack - do not open the first result by default
cnoreabbrev Ack Ack!
set showcmd
nnoremap <silent> <CR> :Ack!<CR>
"removes the . from wors, so that 'my.prop|erty.is' [aiw] returns 'property'
set iskeyword-=.
set iskeyword+=-
set iskeyword-=_
"Sets the active directory in the active window to be the file
"autocmd BufEnter * silent! lcd %:p:h
set nowrap "allow long lines

