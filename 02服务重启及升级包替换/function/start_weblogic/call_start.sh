#!/bin/bash
#email gqoyvf@163.com
#date 2019-7-14
export LANG="en_US.UTF-8"
export s_port=$1
export s_addr=$2
#export this_addr=`pwd`
#echo "this addr is :$this_addr"
if [[ ! `lsof -i:${s_port}|awk '{print $2}'|grep [0-9]|uniq` ]];then
. ./Astart.sh ${s_addr}
else
. ./Pstart.sh ${s_port}
fi

