set nocompatible
filetype on
syntax on
:filetype indent on
set number

"AUTO INDENT set 
set autoindent  "ai
"set cindent     "Auto indent type of C
set smartindent

"TAB set
set tabstop=4       "The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4
set shiftwidth=4    "Indents will have a width of 4
"set softtabstop=4	"detele 4 chars when set `expandtab` on
set expandtab     "Expand TABs to spaces

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


