#!/bin/bash
if [[ -f "list.txt" ]];then
    rm -f list.txt
fi
#输入你要查找的关键字
read -p 'input:' key
#将所有当前目录及子目录下的文件 输入到the_file_list.txt 文件
find ./ -type f -name "*" >the_file_list.txt
#逐行读取文件 找出包含关键字的文件 将文件名输入到 list.txt
cat the_file_list.txt|while read li
do
    this_key=`cat "$li"|grep $key`
    if [[ $this_key ]];then
        echo 'file name:' $li
        echo $li >> list.txt
    fi
done
#删除 the_file_list.txt 只保留 list.txt
rm -f the_file_list.txt
#如果要进行替换 输入你要替换的新关键字 否则 ctrl+c退出
#read -p 'replace ? input:' new_key
#cat list.txt|while read li
#do
#    echo 'replace file' "$li"
#    sed -i 's/'$key'/'$new_key'/g' "$li"
#done
