set nocompatible              " be iMproved, required
filetype off                  " required

" Download plug.vim and put it in ~/.vim/autoload
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'styled-components/vim-styled-components'

Plug 'preservim/nerdcommenter'

call plug#end() " required
filetype plugin indent on " required
