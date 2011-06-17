#! /bin/sh

if [ "$#" -eq "0" ]
then
	echo 'usage : shell_usage.sh <shell_command> '
	echo ''
	echo 'shell language : if case for until while array string'
	echo 'shell commands : test echo trap'
	exit 0
fi

command=$1
if [ "$command" = "if" ]
then
	echo '# if'
	echo 'if [ "10" -lt "12" ]'
	echo 'then'
	echo -e '\techo "Yes, 10 is less than 12 "'
	echo 'fi'
	echo ''
	echo '# if-null'
	echo 'if [ -e "$1" ]; then :; else mkdir $1;fi'
	echo 'if [ -e "$1" ]; then mkdir $1; else :;fi'
	echo ''
	echo '# if-else'
	echo "if grep 'Dave\>' data.file > null 2>&1"
	echo 'then'
	echo -e '\techo "Great Dave is in the file"'
	echo 'else'
	echo -e '\techo "No Dave is not in the file"'
	echo 'fi'
	echo ''
	echo '# if-elif'
	echo 'if [ "$1" -lt "4" ]'
	echo 'then'
	echo -e '\techo "$1 < 4"'
	echo -e 'elif [ "$1" = "4" ]'
	echo 'then'
	echo -e '\techo "$1 = 4"'
	echo 'else'
	echo -e '\techo "$1 > 4"'
	echo 'fi'
elif [ "$command" = "case" ]
then 
	echo 'echo -n "Enter a number from 1 to 5 :"'
	echo 'read ANS'
	echo ''
	echo 'case $ANS in'
	echo '	1) echo "you select 1"'
	echo '	;;'
	echo '	2) echo "you select 2"'
	echo '	;;'
	echo '	3) echo "you select 3"'
	echo '	;;'
	echo '	4) echo "you select 4"'
	echo '	;;'
	echo '	5) echo "you select 5"'
	echo '	;;'
	echo '	*) echo "`basename $0` : This is not between 1 and 5" >&2'
	echo '	exit 1'
	echo '	;;'
	echo 'esac'
	echo ''
	echo 'echo "choices are.. vt100, vt102, vt220"'
	echo 'echo -n "Enter your terminal type :"'
	echo 'read TERMINAL'
	echo 'case $TERMINAL in'
	echo '	vt100|vt102) TERM=vt100'
	echo '	;;'
	echo '	vt220) TERM=vt220'
	echo '	;;'
	echo '	*) echo "unknow type"'
	echo '	;;'
	echo 'esac'
	echo 'echo "TERM : $TERM"'
elif [ "$command" = "for" ]
then 
	echo 'for i in 1 2 3 4 5'
	echo 'do'
	echo '	echo $i'
	echo 'done'
	echo ''
	echo 'for i in `ls`'
	echo 'do'
	echo '	echo $i'
	echo 'done'
	echo ''
	echo 'for i in "$@"'
	echo 'do'
	echo '	echo $i'
	echo 'done'
	echo ''
	echo 'for i '
	echo 'do'
	echo '	echo $i'
	echo 'done'
elif [ "$command" = "until" ]
then 
	echo 'until [ ! -e $1 ]'
	echo 'do'
	echo '	sleep 1'
	echo 'done'
	echo '$1 deleted'
elif [ "$command" = "while" ]
then 
	echo 'i=0'
	echo 'while [ "$i" -lt "100" ]'
	echo 'do'
	echo '	echo $i'
	echo '	i=`expr $i + 1`'
	echo 'done'
elif [ "$command" = "array" ]
then 
	echo 'a=(23 45 46 35 43 54)'
	echo ''
	echo 'echo ${a[2]} # 通过下标访问数组第三个元素'
	echo ''
	echo 'echo ${a[@]} # 访问整个数组'
	echo ''
	echo 'echo ${#a[@]} # 获取数组长度'
	echo ''
	echo 'echo ${a[@]:2:4} # 切片方式访问数组，从第3个元素到第5个元素'
	echo ''
	echo 'echo ${a[@]:2} # 从第二个元素开始'
	echo ''
	echo 'echo ${a[@]::2} # 到第二个元素'
	echo ''
	echo 'a=("${a[@]}", $new_element) # push 操作'
	echo ''
	echo 'a=(${a[@]:0:$((${#a[@]}-1))}) # pop 操作'
	echo ''
	echo 'array=(${array[@]:1}) # shift 操作'
	echo ''
	echo 'array=($new_element "${array[@]}") # unshift 操作'
elif [ "$command" = "string" ]
then 
	echo 'a="good boy good girl"'
	echo 'echo ${#a} # 获得字符串长度'
	echo 'echo ${a/o/d} # 替换一个'
	echo 'echo ${a//o/d} # 替换所有'
	echo 'echo $a | rev # 翻转字符串'
	echo ''
	echo 'echo ${a##*good} # 从左向右截取最后一个good后的字符串'
	echo 'echo ${a#*good} # 从左向右截取第一个good后的字符串'
	echo 'echo ${a%%good*} # 从右向左截取最后一个good后的字符串'
	echo 'echo ${a%good*} # 从右向左截取第一个good后的字符串'
	echo 'echo ${a:2:10} # 截取变量从2到10之间的字符串'
	echo 'echo $a | cut -b2-8 # 以byte为单位, 从第2个开始， 截取8个字符 '
elif [ "$command" = "test" ]
then :
elif [ "$command" = "echo" ]
then :
elif [ "$command" = "trap" ]
then :
	echo "trap \"echo 'Do not interrup me.!'\" INT"
	echo "trap \"echo 'Attempted murder is illegal!'\" TERM"
	echo ""
	echo 'echo "$0'\'' s PID is $$"'
	echo 'while true;'
	echo "do"
	echo -e "\tsleep 30"
	echo "done"
	echo "#try 1. [CTRL-C] 2. [CTRL-Z], bg, kill %1"
else :
fi
