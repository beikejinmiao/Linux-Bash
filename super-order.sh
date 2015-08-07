#!/usr/bin/env sh

#记录一些比较屌的命令

# 1.在指定目录下递归替换所有文件中的内容
## 使用时按需求替换命令中的内容
grep -r -l  'old_content' directory_name/ | xargs  sed -i 's/old_content/new_content/g'


# 2.如果想要替换的内容中有'/'符号
## 可以使用其他符号代替,比如'#'
sed -i 's#old_content#new_content#g'
