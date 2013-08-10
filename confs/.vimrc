if has("syntax")
  syntax on
endif

set nocompatible
set laststatus=2

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

au! BufRead,BufNewFile *.json set filetype=json 

let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936

filetype plugin indent on
set tags=tags;/
set ofu=syntaxcomplete#complete
set completeopt+=longest,menuone
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set softtabstop=2

set wildmenu
set mouse=a
set number
syntax enable

colorscheme Tomorrow-Night
if has("gui_running")
  colorscheme codeschool
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar
endif

set ts=2 sw=2 et
set colorcolumn=80
set undofile
set shell=/bin/bash

let g:Powerline_symbols = 'fancy'
inoremap <Nul> <C-x><C-o>

map <C-k> :NERDTreeToggle<CR>
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cw
