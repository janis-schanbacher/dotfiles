set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'styled-components/vim-styled-components'

Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required
