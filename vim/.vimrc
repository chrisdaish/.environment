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

" Allow backspacing over everything in insert mode
 set backspace=indent,eol,start

" Dont save .netrwhist history
let g:netrw_dirhistmax=0
 
" never do this again --> :set paste <ctrl-v> :set no paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" -----{ Syntastic }-----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_puppet_puppetlint_args='--no-documentation-check --no-80chars-check --no-class_inherits_from_params_class-check'

" -----{ Airline }-----
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" -----{ Dockerfile }-----
autocmd FileType dockerfile set noexpandtab

" -----{ NERDTree }-----
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
