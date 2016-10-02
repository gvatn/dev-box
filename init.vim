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
Plug 'terryma/vim-expand-region'
call plug#end()

set background=light
colorscheme solarized

" Quick esc from insert mode
inoremap jk <Esc>
nnoremap <C-p> :FZF<CR>

" Move a few lines with Shift + j/k
nnoremap <S-j> 3j
nnoremap <S-k> 3k

let mapleader = ","
let maplocalleader = ","

" Open files http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Create directory relative to current file
map <leader>d mkdir -p %%

" Write file
map <leader>s :w<cr>



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
