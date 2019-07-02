#！/bin/bash
#第一个shell小程序,echo是linux中的输出命令
hello="hello world"
echo $hello
echo "helloworld!"

#字符串可以用双引号也可以用单引号
jinx='i am jinx'
echo $jinx

#拼接字符串
name1='jinx'
name2='lux'
#单引号拼接
str1='hello,'$name1'!'
str2='hello,'$name2'!'
echo $str1.$str2
#双引号拼接
str3="hello,"$name1""
str4="hello,"$name2""
echo $str3,$str4

#获取字符串长度
echo ${#name1}

#运算
expr 5 + 6

#截取字符串
echo ${name1:0:2}
#根据表达式截取
var="http://www.jinx.com"
echo ${var%%t*}
echo ${var%t*}

#shell数组
array=(1 2 3 4 5);
#获取数组长度
length=${#array[@]}
length2=${#array[*]}
echo $length
echo $length2
#输出第三个元素
echo ${array[2]}
#删除第二个元素
unset array[1]
#遍历数组
for i in ${array[@]};do echo $i;done;
#删除数组所有元素
unset arr_number;
for i in ${array[@]};do echo $i;done;

#算数运算符加法(val需要用反引号包起来，该符号位于tab键上方)
a=3;b=4;
val=`expr $a + $b`
echo $val
#关系运算符(只支持数字，不支持字符串，除非字符串值是数字)
score=90
#此处结尾可以有分号也可以没有
maxScore=100;
if [ $score -eq $maxScore ]
then
 echo "A"
else
 echo "B"
fi
#逻辑运算符&& ||
a=$((1&&0))
echo $a
#布尔运算符! -o -a
a=$((1!=2))
echo $a
#字符串运算符= != ...
a="abc"
b="23"
if [ $a = $b ]
then 
 echo "true"
else
 echo "false"
fi
#文件相关运算符-r file|-w file
path="/Users/jinx/IdeaProjects/personal/shellStudy"
if [ -r $path ]
then 
 echo "read"
else
 echo "write"
fi

#shell流程控制
#if条件语句(if中不能包含空语句)
a=3
b=9
if [ $a -eq $b ]
then
 echo "a等于b"
elif [ $a -gt $b ]
then
 echo "a大于b"
else
 echo "a小于b"
fi
#for循环
#输出当前列表中的数据
for loop in 1 2 3 4 5;do  echo "The value is:$loop";done
#产生10个随机数
for i in {0..9};do echo "random value is:$RANDOM";done;
#输出1到5
for((i=1;i<=5;i++));do echo "circle value is:$i";done;
#while语句
a=1
while(( $a<=5 ))
do
 echo "a:$a"
 let a++
done
#while循环可用户读取键盘输入信息
#echo "按下<ctrl-d>退出"
#echo "输入你喜欢的电影:"
#while read FILM
#do
# echo "是的!$FILM 是一个好电影"
#done
#无限循环
a=1
#while true
#do
# command
# echo $a
# let a++
#done

#shell函数
#不带参数无返回值的函数
hello(){
 echo "this is my first shell function()"
}
echo "函数开始执行"
hello
echo "执行完毕"
#有返回值的函数
functionWithReturn(){
echo "输入第一个数字："
read aNum
echo "输入第二个数字："
read bNum
echo "两个数字分别为 $aNum 和 $bNum !"
return $(($aNum + $bNum))
}
#functionWithReturn
echo "输入两个数字之和为 $?"
#带参数的函数
funWithParam(){
echo "第一个参数为 $1!"
echo "第二个参数为 $2!"
echo "第十个参数为 $10!"
echo "第十个参数为 ${10}!"
echo "参数总共有 $#个!"
echo "作为一个字符串输出所有参数 $*!"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73
