execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

if has('gui_running')
  set guifont=Monospace\ 8
endif

let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" let g:solarized_termcolors=16

set tabstop=2 shiftwidth=2 expandtab
set mouse=
