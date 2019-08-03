#!/bin/bash
#date 0802
if [ ! -d './temp' ];then
	mkdir ./temp
fi
rm -f ./temp/*
find ./ -regex ".*/.*\.\(sql\|dmp\)" -exec cp {} ./temp/ \;
cd ./temp
ls |grep -v 1.txt >1.txt
sort 1.txt -o 1.txt
i=1
for li in `cat 1.txt`;
do
	mv ./$li ./${i}_${li}
	((++i))
done
rm -f 1.txt




