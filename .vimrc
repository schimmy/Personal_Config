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
autocmd BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.go set filetype=go

colorscheme desert

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

set pastetoggle=<F2>
set showmode

:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

call pathogen#infect() 
call pathogen#helptags()

set nocompatible

filetype off
filetype plugin on
filetype plugin indent off
set runtimepath+=/Users/colinschimmelfing/go/misc/vim
filetype plugin indent on
syntax on

