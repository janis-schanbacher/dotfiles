" General settings

syntax on
set encoding=utf-8
" set number relativenumber
set number
set shell=bash
set mouse=a
set clipboard=unnamedplus
set backspace=indent,eol,start

" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete all trailing whitespace on save, if FileType is not on blacklist.
let blacklist = ['markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 |  %s/\s\+$//e
" autocmd BufWritePre * %s/\s\+$//e

autocmd ColorScheme * hi Normal ctermbg=NONE
