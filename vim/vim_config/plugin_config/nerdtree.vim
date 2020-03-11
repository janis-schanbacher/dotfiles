" Open nerdtree on startup, if no files are specified and no saved session is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" Open nerdtree on startup, if no files are specified and no saved session is opened
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" toggle nerdtree
map <C-n> :NERDTreeToggle<CR>
" open nerdtree on the current file
nnoremap <silent> <Leader>n :NERDTreeFind<CR>

" close nerdtree when opening a file
let NERDTreeQuitOnOpen = 1

" Close tab if only remaining window is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Delete buffer of file when deleting it with nerdtree
let NERDTreeAutoDeleteBuffer = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" highlight filenames by extension
let g:NERDTreeFileExtensionHighlightFullName = 1

let NERDTreeShowHidden=1

" default mappings
" ctrl + ww --> switch between nerdtree and opened windows
" ctrl + w + (h/j/k/l) --> switch focus
" R --> Refresh nerdtree

