" don't bother with vi compatibility
set nocompatible

syntax enable " enable syntax highlighting

" set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
" set backspace=2                                              " Fix broken backspace in some setups
" set backupcopy=yes                                           " see :help crontab
set background=dark
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
" set encoding=utf-8
set expandtab                                                " expand tabs to spaces
" set ignorecase                                               " case-insensitive search
" set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫,eol:¬
" set ruler                                                    " show where you are
" set scrolloff=3                                              " show context above/below cursorline
" set showcmd
" set smartcase                                                " case-sensitive search if any caps
" set wildignore=node_modules/**,tmp/**
" set wildmenu                                                 " show a navigable menu for tab completion
" set wildmode=longest,list,full
set mouse=a                                                    " Enable basic mouse behavior such as resizing buffers.
set number                                                   " show line numbers
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters

" keyboard shortcuts
" -----------------------------------------------------------------------------------------------------------------------
" toggle :Ack with leader a
nnoremap <leader>a :Ack<space>
let mapleader = ','
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" go to end of previous word
noremap <S-E> gE
noremap! jj <ESC>

" autocmd BufRead,BufNewFile *.md set filetype=markdown  " md is markdown
" autocmd BufRead,BufNewFile *.md set spell
" autocmd VimResized * :wincmd =                         " automatically rebalance windows on vim resize

" Fix Cursor in TMUX
" if exists('$TMUX')
"   set ttymouse=xterm2
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

" Don't copy the contents of an overwritten selection.
" vnoremap p "_dP

" set nocursorline " don't highlight current line

" keyboard shortcuts

set hlsearch                     " highlight search
nmap <leader>hl :let @/ = ""<CR> " escape/unhighlight search

" gui settings
colorscheme solarized

" ctrlp.vim
let g:ctrlp_custom_ignore = { 'dir': '\.git$\|node_modules' }

" enable Omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" tsuquyomi (typescript syntastic/omni completion integration)
let g:tsuquyomi_completion_detail = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

" configure ack.vim with ag (the silver searcher)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
