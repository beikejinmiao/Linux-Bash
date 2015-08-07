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
