#!/bin/bash
######################################################################################
#File Name      : learn-order.sh
#Author         : Li Jinmiao
#Mail           : beikejinmiao@gmail.com
#Created Time   : 2015-12-09 15:57:10
#Description    : learn shell order 
######################################################################################

# 1.统计目录下文件或者子目录的个数
## 注意递归与非递归统计，也要注意隐藏与非隐藏
## 1.1 ls, grep, wc
#文件统计
ls -l  |grep "^-" |wc -l
ls -la |grep "^-" |wc -l                        #包括隐藏文件
ls -l  |grep "^-" |grep ".*\.log$" |wc -l       #统计以`.log`结尾的日志非隐藏文件个数,即不包含.log文件
ls -la |grep "^-" |grep ".*\.log$" |wc -l       #统计以`.log`结尾的日志文件个数,包含.log文件
ls -lR |grep "^-" |grep -v ".*\.log$" |wc -l    #递归搜索当前目录下所有不以`.log`结尾的非隐藏文件个数
ls -lR directory_name/ |grep "^-" |wc -l        #可以指定搜索目录
#目录统计
ls -l  |grep "^d" |wc -l
# ls -laR  |grep "^d" |wc -l   
##非常不建议这么写，因为参数`a`会打印出隐藏的当前目录`.`与上层目录`..`
##每个目录下都有`.`与`..`，递归统计时都会被统计到，结果没有任何意义

## 1.2 find, grep, wc
## 默认递归搜索,统计隐藏文件与目录
find directory_name/ -type f | grep exe | wc -l #统计指定目录下文件名包含`exe`的文件个数,包括隐藏文件 
find directory_name/ -type d | wc -l            #统计指定目录下子目录数量，包括隐藏目录，但不存才`ls -laR`的问题


