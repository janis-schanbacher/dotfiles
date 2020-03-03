let mapleader = " "

" jj to leave insert-moode
imap jj <Esc>

" Swap lines
noremap <leader>j ddpkj
noremap <leader>k kddpk

" Go to tab/buffer by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" Cycle buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Save
nnoremap <leader>w :w<Enter>

" Source .vimrc
nnoremap <leader>so :so ~/.vimrc<Enter>
" Install plugins
nnoremap <leader>pl :PlugInstall<Enter>

" Toggle relative numbers
map <leader>ln :setlocal relativenumber!<Enter>

" Higlight & search current word
nnoremap <leader>* :let @/ = '<c-r><c-w>' \| set hlsearch<cr>
" toggle highlight search
nnoremap <leader>hs :set hlsearch!<Enter>

" Regular Ctrl + v pasting in insert mode instead of Ctrl + Shift + v
inoremap <silent> <C-v> <C-R>"
