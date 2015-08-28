set nocompatible
filetype on
syntax on
:filetype indent on
set et
set ci
set shiftwidth=4
set number

:set ts=4
set expandtab
:%retab!
:set modifiable

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>


"auto add file header --start
autocmd BufNewFile *.sh 0r ~/.vim/template/shell_header
autocmd BufNewFile *.py 0r ~/.vim/template/python_header
autocmd BufNewFile *.py,*.sh  ks|call FileName()|'s
autocmd BufNewFile *.py,*.sh  ks|call CreatedTime()|'s

fun FileName()
    let info = "File Name      :"
    if line("$") > 10
        let len = 10
    else
        let len = line("$")
    endif
    exe "1," . len . "g#".info.".*#s#".info.".*#".info." ".expand("%")
    "exe 1,5g#File Name      :.*#s#File Name      :.*#File Name      :".expand("%")
endfun


fun CreatedTime()
    let info = "Created Time   :"
    if line("$") > 10
        let len = 10
    else
        let len = line("$")
    endif
    exe "1," . len . "g#".info.".*#s#".info.".*#".info." ".strftime("%Y-%m-%d %T")
endfun
"auto add file header --end  


