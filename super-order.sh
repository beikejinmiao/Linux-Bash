#!/usr/bin/env sh

# 1.在指定目录下递归替换所有文件中的内容
## 使用时按需求替换命令中的内容
grep -r -l  'old_content' directory_name/ | xargs  sed -i 's/old_content/new_content/g'


# 2.如果想要替换的内容中有'/'符号
## 可以使用其他符号代替,比如'#','%'等等
sed -i 's#old_content#new_content#g'


# 3.判断字符串是否以某个字符开头
[[ $line == h* ]]   # True, 如果$line以h开头(通配符匹配).
[[ $line == "h*" ]] # True, 如果$line内容等于h*(内容完全匹配).

## 如果想判断是否以特殊字符(如#)开头，需加转义
if [[ $line = \#* ]] ; then
    echo "$line starts with #"
fi
### 或者
if [[ ${line:0:1} = \# ]] ; then
    echo "$line starts with #"
fi

