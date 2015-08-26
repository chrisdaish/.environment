execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" Use Vim settings, rather than Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
" set nocompatible

if has('gui_running')
  set guifont=Monospace\ 8
endif

" ColourScheme Options
set background=dark
set t_Co=16
let g:solarized_termcolors=16
" let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" Set 2 space tabs
set tabstop=2
set shiftwidth=2
set expandtab

" StatusBar
set laststatus=2
set ruler
set showcmd
set incsearch

" Line Numbers
set number

" Mouse config
set mouse=""
