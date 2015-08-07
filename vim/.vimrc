set nocompatible
filetype on 
syntax on 
"set autoindent 
"set cindent 
:filetype indent on
set et
set ci
set shiftwidth=4
set number

:set ts=4
:set expandtab
:%retab!

:set modifiable

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
