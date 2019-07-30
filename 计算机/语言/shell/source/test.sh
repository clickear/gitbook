#!/bin/bash

# shell中使用 #进行注释行
# 需求: 编写一个脚本,显示时间和日期,列出所有的登录用户,然后这个脚本将会把这些内容保存到一个 log file 中.
LOG_FILE_PATH=/data/logs # 定义变量，并且初始化。 shell中可直接这样定义变量，而没有类型的区别
if [[ -n $LOG_FILE_PATH/date.log ]] ;then # 判断是否存在文件，不存在则创建 
	touch $LOG_FILE_PATH/date.log
fi
date "+%Y_%m_%d %H:%M:%S" >> $LOG_FILE_PATH/date.log
who >> $LOG_FILE_PATH/date.log 

te=23
if [[ $te ]] ;then
	echo "test"
fi

