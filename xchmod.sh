#!/bin/bash
####################################################################################
#File Name      : xchmod.sh
#Author         : Li Jinmiao
#Mail           : beikejinmiao@gmail.com
#Created Time   : 2015-08-31 09:40:32
#Description    : 'chmod +x' for python's file and  shell script for given path
####################################################################################

path=$1
if [ -z "${path}" ]; then
    path=`pwd`      ##若没指定目录,则默认为当前工作目录
fi

##判断目录存在性
if [ ! -d ${path} ]; then
    echo "'${path}' is not exist Or '${path}' is not a directory!"
    exit 1
fi

##判断目录操作权限
if [ ! -x ${path} -o ! -w ${path} ]; then
    echo "You have no right to operate the directory of '$path'!"
    exit 1
fi

reg=".(py|sh)$"             ##正则:以'.py'或者'.sh'结尾的文件
rlt=1
for file in ${path}/*       ##遍历指定目录
do 
    if [ ! -x ${file} ]; then 
        if [[ ${file} =~ $reg ]]; then
            `chmod +x ${file}` && echo "chmod +x" \"${file}\"
            rlt=$?
        fi
    fi
done

[ $rlt -eq 1 ] && echo "Nothing to do."
echo "Done."


