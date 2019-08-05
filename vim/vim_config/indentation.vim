" Auto-Indent
  " Add new lines with same indentation
    :set autoindent
  " Automatically insert one extra level of indentation in some cases
    :set smartindent
  imap <C-Return> <CR><CR><C-o>k<Tab>

" Set TAB to consist of 2 spaces
	set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
