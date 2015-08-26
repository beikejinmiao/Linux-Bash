自定义的vim配置,需将vim配置放在用户主目录下     
$HOME/.vimrc -- vim配置文件    
$HOME/.vim   -- vim插件目录    

.vimrc     

    set nocompatible            "不要使用vi的键盘模式，而是vim自己的
    filetype on                 "侦测文件类型
    syntax on                   "语法高亮
    "set autoindent 
    "set cindent 
    :filetype indent on     
    set et
    set ci                      "自动缩进
    set shiftwidth=4            "统一缩进为4
    set number                  "显示行号
    
    :set ts=4                   "设定'Tab'长度为4
    :set expandtab
    :%retab!
    
    :set modifiable
    
    map <F3> :NERDTreeMirror<CR>    "快捷键'F3'打开或者关闭NERDTree插件
    map <F3> :NERDTreeToggle<CR> 
    
    "要开始编辑新文件时读入一个骨架 (样板) 文件:
    autocmd BufNewFile *.sh 0r ~/.vim/template/shell_header "要在写入一个 *.sh 文件时插入文件名和当前日期和时间
    autocmd BufNewFile *.py 0r ~/.vim/template/python_header
    autocmd BufNewFile *.py,*.sh  ks|call FileName()|'s
    autocmd BufNewFile *.py,*.sh  ks|call CreatedTime()|'s
    "ks                 保存当前位置到 's' 标记
    "call CreatedTime() 调用 CreatedTime() 函数完成工作
    "'s                 光标回到旧的位置

    fun CreatedTime()
        let info = "Created Time   :"
        if line("$") > 10
            let len = 10
        else
            let len = line("$")
        endif
        exe "1," . len . "g/".info.".*/s/".info.".*/".info." ".strftime("%Y-%m-%d %T")
    endfun 
    "CreatedTime() 函数先检查文件是否少于 10 行，然后用 ":g" 命令查找包含 "Created Time   :" 的行。
    "在这些行上执行 ":s" 命令实现从已有的时间到当前时间的替换。
    ":execute" 命令使 ":g" 和 ":s" 命令可以使用表达式。
    "日期用 strftime() 函数取得。它可以用别的参数取得不同格式的日期字符串。

对于vim 的 "autocmd" 命令，下面这篇文章有非常棒的解释:
[VIM 参考手册-AUTOCMD](http://vimcdoc.sourceforge.net/doc/autocmd.html)



