source $HOME/dotfiles/vim/vim_config/plugins.vim
source $HOME/dotfiles/vim/vim_config/plugin_config.vim
source $HOME/dotfiles/vim/vim_config/general.vim
source $HOME/dotfiles/vim/vim_config/indentation.vim
source $HOME/dotfiles/vim/vim_config/features.vim

" Below is a fix for devicons after re-sourcing the vimconfig
	if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
	endif
