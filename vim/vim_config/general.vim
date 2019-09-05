" General settings

syntax on
set encoding=utf-8
set number relativenumber
set shell=bash
set mouse=a
set clipboard=unnamedplus

" Disable automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically delete all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
