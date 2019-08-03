#!/bin/bash
#email gqoyvf@163.com
#date 2019-7-19
export LANG="en_US.UTF-8"
#touch ./upgrade_log/temp.log
tail -4 ./upgrade_log/upgrade.log > ./upgrade_log/temp.log
rm -f ./upgrade_log/upgrade.log
mv ./upgrade_log/temp.log ./upgrade_log/upgrade.log
cd ./bak_jar
ls | egrep -v `tail -4 ../upgrade_log/upgrade.log |awk {'print $3'}|tr -cd "[0-9]|\n"|sed ':a;N;s/\n/|/g;ta'`|xargs rm -rf
cd ../ 
