syntax on
filetype plugin indent on

" spaces instead of tabs
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Search
set ignorecase
set smartcase
set hlsearch

" Neovim by default uses utf-8
" set encoding=utf-8
set number

" vim-expand-region plugin
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Plugins
call plug#begin('~/.vim/plugged')

" General
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'Raimondi/delimitMate'
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ensime/ensime-vim'
Plug 'derekwyatt/vim-scala'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'terryma/vim-expand-region'
Plug 'iCyMind/NeoSolarized'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-clang'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'pearofducks/ansible-vim'
call plug#end()

let g:deoplete#sources#clang#libclang_path="/home/ubuntu/source/build/lib/libclang.so"
let g:deoplete#sources#clang#clang_header="/home/ubuntu/source/build/lib/clang"

" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Tern key goto def
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

augroup omnifuncs
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

set termguicolors
set background=dark
colorscheme NeoSolarized

" Quick esc from insert mode
inoremap jk <Esc>

" CtrlP
nnoremap <C-p> :CtrlP<CR>
nnoremap <C-h> :CtrlPBuffer<CR>
nnoremap <C-j> :CtrlPMRU<CR>

" Move a few lines with Shift + j/k
nnoremap <S-j> 3j
nnoremap <S-k> 3k

let mapleader = ","
let maplocalleader = ","

" Open files http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap <leader>ew :e %%
nmap <leader>es :sp %%
nmap <leader>ev :vsp %%
nmap <leader>et :tabe %%

" Create directory relative to current file
nmap <leader>d :!mkdir -p %%

" Write file
nmap <leader>w :w<cr>
nmap <leader>s :w<cr>

" :q
nmap <leader>q :q<cr>

" Reload init.vim
nmap <leader>v :so ~/.config/nvim/init.vim<cr>

" Add four lines and insert into the second
nmap <leader>z 4O<Esc>3ki

" Neomake
autocmd! BufWritePost * Neomake

" Deoplete
let g:deoplete#enable_at_startup=1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose |endif

nmap <C-o> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeToggle<CR>
silent! map <C-O> :NERDTreeFind<CR>
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" Scala
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>t :EnTypeCheck<CR>
