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

" Neovim by default uses utf-8
" set encoding=utf-8
set number

" Quick esc from insert mode
inoremap <C-j> <Esc>
nnoremap <C-p> :FZF<CR>
nnoremap <S-j> 3j
nnoremap <S-k> 3k

" Plugins
call plug#begin('~/.vim/plugged')

" General
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
call plug#end()

set background=light
colorscheme solarized

" Neomake
" autocmd! BufWritePost * Neomake

" Deoplete
" let g:deoplete#enable_at_startup=1

nmap <C-o> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeToggle<CR>
silent! map <C-O> :NERDTreeFind<CR>
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" Scala
autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>t :EnTypeCheck<CR>
