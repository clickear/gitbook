# shell

[TOC]

## 书籍推荐 

+ 高级shell脚本编程指南
+ [shell笔记](https://github.com/redhatxl/myshell-note/blob/master/source/myshell-note.md)
+ [shell笔记](https://github.com/52fhy/shell-book/blob/master/chapter1.md)

## shell是什么？

> shell 是一个命令解释器.是介于操作系统 kernel 与用户之间的一个绝缘层.准确地说,它也是一
> 一种强力的计算机语言.一个 shell 程序,被称为一个脚本。

将一些shell命令组合起来，写到脚本文件中，进行执行，而不用一个个执行。

```bash
#!/bin/bash

# shell中使用 #进行注释行
# 需求: 编写一个脚本,显示时间和日期,列出所有的登录用户,然后这个脚本将会把这些内容保存到一个 log file 中.
LOG_FILE_PATH=/data/logs # 定义变量，并且初始化。 shell中可直接这样定义变量，而没有类型的区别
if [[ -n $LOG_FILE_PATH/date.log ]] ;then # 判断是否存在文件，不存在则创建 
	touch $LOG_FILE_PATH/date.log
fi
date "+%Y_%m_%d %H:%M:%S" >> $LOG_FILE_PATH/date.log
echo `who` >> $LOG_FILE_PATH/date.log 
```

 ## She-Bang

> Shebang通常出现在类Unix系统的脚本中第一行，作为前两个字符。在Shebang之后，可以有一个或数个空白字符，后接解释器的绝对路径，用于指明执行这个脚本文件的解释器。即

+ `#! 一句必须在文件的最开始，第一行`

+ `#! 开头的一行会设置解释器运行环境`
+ `需要绝对路径`
+ `如果没有填写，则默认 $SHELL 的值进行执行。一般是 bash    `

例如:

```
#!/bin/bash 
#!/usr/bin/env bash  
# 建议第二种用法
```

## 执行shell

+ 执行执行

```shell
bash test.sh
```

+ ./ 执行

```shell
# 需要赋予可执行权限 sudo chmod +x test.sh
./test.sh
```

+ source

```shell
source test.sh
```

## shell 变量

> shell变量是一种弱类型，所有变量类型视为字符串类型，对于数值相加自动转换为数值类型，无需实现声明

#### 变量命名规则

+ 命名只能使用英文字母，数字和下划线，首个字符不能以数字开头。(大部分命名都是这样)
+ 中间不能有空格，可以使用下划线（_）。 有空格，区分不出变量是不是结束了
+ 不能使用标点符号。
+ 不能使用bash里的关键字（可用help命令查看保留关键字）

环境变量作用范围：当前shell进程及其子进程

本地变量作用范围：当前shell

局部变量作用范围：代码片段

利用export将本地变量导入到环境，扩大作用范围

#### 系统内置变量

> 在命令行提示符直接执行`env、set`查看系统或环境变量。`env` 显示用户环境变量，`set` 显示 Shell 预先定义好的变量以及用户变量。可以通过 `export` 导出成用户变量。

```shell
$SHELL      默认 Shell

$HOME       当前用户家目录

$IFS        内部字段分隔符

$LANG       默认语言

$PATH       默认可执行程序路径

$PWD        当前目录

$UID        当前用户 ID

$USER       当前用户

$HISTSIZE   历史命令大小，可通过 HISTTIMEFORMAT 变量设置命令执行时间

$RANDOM     随机生成一个 0 至 32767 的整数

$HOSTNAME   主机名
```

#### 特殊变量

```shell
${1..n} 指定第n个输入的变量名称
$0      脚本自身名字

$?      返回上一条命令是否执行成功，0 为执行成功，非 0 则为执行失败

$#      位置参数总数

$*      所有的位置参数被看做一个字符串

$@      每个位置参数被看做独立的字符串

$$      当前进程 PID

$!      上一条运行后台进程的 PID
```

**相同点**：都是引用所有参数。

**不同点**：只有在双引号中体现出来。假设在脚本运行时写了三个参数 1、2、3，，则 ” * ” 等价于 “1 2 3”（传递了一个参数），而 “@” 等价于 “1” “2” “3”（传递了三个参数）。

profile 类型： * 定义全局变量 * 运行命令或脚本

bashrc 类型： * 定义本地变量 * 定义命令别名

交互式登录shell： 加载顺序：/etc/profile -> /etc/profile.d/* -> ~/.bash_profile -> ~/.bashrc -> /etc/bashrc

非交互式登录shell： 加载顺序：~/.bashrc -> /etc/bashrc -> /etc/profile.d/*

#### 用户自定义变量

- 普通变量

```
[root@shell workspace]# var=normal
[root@shell workspace]# echo $var
normal
```

- 临时环境变量

在当前shell下定义的变量，只对当前shell有效，新的bash已经其子bash无法使用当前定义的shell，如果在本shell存在的情况下，使用`export`来导入到系统变量中，如果当前shell终端终端，那么导入的变量将全部失效，永久生效需要写入linux配置文件中。

- 只读变量

```
[root@shell ~]# var='test'
[root@shell ~]# echo $var
test
[root@shell ~]# readonly var
[root@shell ~]# var='bbb'
-bash: var: readonly variable
```

- 删除变量

```
unset variable_name
```

变量被删除后不能再次使用。unset 命令不能删除只读变量。



#### 变量引用

- = 变量赋值
- += 变量相加

```
[root@shell data]# var=123
[root@shell data]# var+=234
[root@shell data]# echo $var
123234
```

为避免特殊字符及变量与字符连接使用，建议引用变量添加大括号

####  引号

单引号是告诉 Shell 忽略特殊字符，而双引号则解释特殊符号原有的意义，比如$、！。

```shell
[root@xuel-tmp-shell www]# var1="aaa"
[root@xuel-tmp-shell www]# echo '$var1'
$var1
[root@xuel-tmp-shell www]# echo "$var1"
aaa
[root@xuel-tmp-shell www]# var2="aa"
[root@xuel-tmp-shell www]# var3='bb $var2'
[root@xuel-tmp-shell www]# echo $var3
bb $var2
[root@xuel-tmp-shell www]# var4="bb $var2"
[root@xuel-tmp-shell www]# echo $var4
bb aa
```

#### 注释

- 单行注释使用`#`
- 多行注释固定函数格式

```shell
:<<EOF
内容...
内容...
EOF
```