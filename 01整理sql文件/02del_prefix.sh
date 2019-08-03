#!/bin/bash
# date 0802
cd ./temp
ls |grep -v 1.txt >1.txt
for li in `cat 1.txt`;
do 
	mv ./$li ./${li#*_}
done
rm -f 1.txt