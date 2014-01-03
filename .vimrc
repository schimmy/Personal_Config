syntax on

set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set background=dark
"let g:indent_guides_start_level=2

set paste
"set rnu

au BufRead,BufNewFile *.szl set filetype=szl
au! Syntax szl source $HOME/szl.vim

au BufRead,BufNewFile *.pp set filetype=ruby

colorscheme desert

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

call pathogen#infect() 
