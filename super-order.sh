#!/usr/bin/env sh

#记录一些比较屌的命令

# 1.在指定目录下递归替换所有文件中的内容
## 使用时按需求替换命令中的内容
grep -r -l  'old_content' directory_name/ | xargs  sed -i 's/old_content/new_content/g'
