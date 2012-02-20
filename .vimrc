syntax on

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set list listchars=tab:\ \ ,trail:·

au BufRead,BufNewFile *.szl set filetype=szl
au! Syntax szl source $HOME/szl.vim

au BufRead,BufNewFile *.pp set filetype=ruby

colorscheme desert

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
