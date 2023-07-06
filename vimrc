" don't bother with vi compatibility
set nocompatible

syntax enable " enable syntax highlighting

" set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set background=dark                                          " set theme to darkbackground (specifically for solarized dark)
set balloondelay=150
set ballooneval
set balloonevalterm
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
set ttymouse=sgr

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
set completeopt=longest,menuone,preview
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
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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
let g:ale_completion_enabled = 0
let g:ale_set_quickfix = 0
"let g:ale_virtualtext_cursor = 1
"let g:ale_set_balloons = 1
" let g:ale_cursor_detail=1
" augroup ale_hover_cursor
"   autocmd!
"   autocmd CursorHold * ALEHover
" augroup END
let g:ale_linters = {
\   'java': ['checkstyle'],
\   'javascript': ['eslint'],
\   'kotlin': ['ktlint'],
\   'typescript': ['tslint', 'eslint'],
\}
let g:ale_fixers = {
\   'java': ['square_java_format'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}
let g:ale_fix_on_save = 1
" enable Omni completion
"set omnifunc=ale#completion#OmniFunc
"nnoremap K :ALEHover<CR>
" show type on hover in a floating bubble
" if v:version >= 801
"   echo 'version 8'
"   set balloonevalterm
"   let g:ale_set_balloons = 1
"   let balloondelay = 250
" endif
function! SquareJavaFormat(buffer) abort
    return {
    \   'command': 'square-java-format %t',
    \   'read_temporary_file': 1,
    \}
endfunction

function! s:PostPluginConfiguration()
  execute ale#fix#registry#Add('square_java_format', 'SquareJavaFormat', ['java'], 'Fix Java files with square-java-format.')
  " Use ALE and also some plugin 'foobar' as completion sources for all code.
  " call deoplete#custom#option('sources', {
  " \ '_': ['ale'],
  " \})
endfunction
command! -nargs=0 PostPluginConfiguration call s:PostPluginConfiguration()
autocmd VimEnter * PostPluginConfiguration

" Use deoplete.
" let g:deoplete#enable_at_startup = 1


" Returns either the contents of a fold, lint err/warn or godef.
" function! BalloonExpr()
"   let foldStart = foldclosed(v:beval_lnum)
" 
"   " check if we are in a fold
"   if foldStart >= 0
"     let foldEnd = foldclosedend(v:beval_lnum)
"     let numLines = foldEnd - foldStart + 1
"     let lines = []
"     " Up to 31 lines get shown okay; beyond that, only 30 lines are shown with
"     " ellipsis in between to indicate too much. The reason why 31 get shown ok
"     " is that 30 lines plus one of ellipsis is 31 anyway.
"     if ( numLines > 31 )
"       let lines = getline( foldStart, foldStart + 14 )
"       let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
"       let lines += getline( foldEnd - 14, foldEnd )
"     else
"       let lines = getline( foldStart, foldEnd )
"     endif
" 
"     "return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
"     call popup_beval(lines, #{mousemoved:'word'})
"     return ""
"   endif
" 
"   " check if there is a lint error on the line
"   let l:loclist = get(g:ale_buffer_info, v:beval_bufnr, {'loclist': []}).loclist
"   let l:index = ale#util#BinarySearch(l:loclist, v:beval_bufnr, v:beval_lnum, v:beval_col)
"   " get the lint message if found
"   if l:index >= 0
"     return l:loclist[l:index].text
"   endif
" 
"   " use golang as default
"   return go#tool#DescribeBalloon()
" endfunction
" set balloonexpr=BalloonExpr()


command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"
