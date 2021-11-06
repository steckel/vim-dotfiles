" don't bother with vi compatibility
set nocompatible

syntax enable " enable syntax highlighting

" set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set background=dark                                          " set theme to darkbackground (specifically for solarized dark)
set cursorcolumn                                             " highlight current column
set cursorline                                               " highlight current line
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
let mapleader = ','
nnoremap <leader>a :Ack<space>                              " toggle :Ack with leader a
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <C-w>c :tabnew<CR>                                 " tab navigation
nnoremap <C-w>p :tabp<CR>
nnoremap <C-w>n :tabn<CR>
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

" enable spellcheck
set spell spelllang=en_us
" gui settings
" Force to use underline for spell check results
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  augroup END
colorscheme solarized

" ctrlp.vim
let g:ctrlp_custom_ignore = { 'dir': '\.git$\|node_modules' }

" DOCUMENT ME
filetype plugin on

" configure ack.vim with ag (the silver searcher)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" 'longest' will change the 'completeopt' option so that Vim's popup menu
" doesn't select the first completion item, but rather just inserts the
" longest common text of all matches.
" 'menuone' changes the menu so it'll come up even if there's only one match.
set completeopt=longest,menuone
" Change the behavior of the <Enter> key when the popup menu is visible. In
" that case the Enter key will simply select the highlighted menu item, just
" as <C-Y> does.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Make <C-N> work the way it normally does; however, when the menu appears,
" the <Down> key will be simulated. What this accomplishes is it keeps a menu
" item always highlighted. This way you can keep typing characters to narrow
" the matches, and the nearest match will be selected so that you can hit
" Enter at any time to insert it.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-j> pumvisible() ? "\<lt>Down>" : '<C-j>'
inoremap <expr> <C-k> pumvisible() ? "\<lt>Up>" : '<C-k>'
" TODO(steckel): Do I really need this one?
" Simulates <C-X><C-O> to bring up the omni completion menu, then it simulates
" <C-N><C-P> to remove the longest common text, and finally it simulates
" <Down> again to keep a match highlighted.
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Rust
" ========================================================================
let g:rustfmt_autosave = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
" Rust Omnicomplete
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer = 1

" ALE: Asynchronous Lint Engine
" ========================================================================
let g:ale_linters = {
\   'java': [''],
\}
