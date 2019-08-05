source /dotfiles/vim/vim_config/general.vim
source /dotfiles/vim/vim_config/indentation.vim

" Below is a fix for devicons after re-sourcing the vimconfig
	if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
	endif
