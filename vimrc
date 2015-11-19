" File: .vimrc
" Version: 1
" Author: Tamas Gal
" Created: 21 Jan 2003 9:40:01
"
" Last-modified: 24 June 2015 22:24:23

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
let mapleader = ","

set encoding=utf8
set term=xterm-256color

set shiftwidth=4 softtabstop=4
set expandtab
set number
set relativenumber
set showmatch
set smartcase
set scrolloff=2

set ruler
set cursorcolumn

" Search options
set ignorecase
set smartcase
set hlsearch

" Highlight lines with more than 80columns
" highlight OverLength ctermbg=red ctermfg=white guibg=red
" match OverLength /\%81v.\+/
set colorcolumn=80

" Trailing whitespace
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes.git'
Plugin 'bling/vim-airline'
Plugin 'Shougo/vimproc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'luochen1990/rainbow'
Plugin 'pangloss/vim-javascript'
let g:rainbow_active = 0
"Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]

" Unit test (python)
"map <Leader>r :! py.test -l %<CR>
nnoremap <Leader>u :! py.test -l<CR>

" GHC-mod
map <Leader>t :GhcModType<CR>
map <Leader>c :GhcModCheck<CR>

" Color schemt
colo hemisu

" Airline
set laststatus=2
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts = 1

set guifont=Source\ Code\ Pro\ for\ Powerline:h12

" JavaScript
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
