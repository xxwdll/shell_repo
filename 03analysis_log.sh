#!/bin/bash
#date 190809
#email gqoyvf@163.com
#info https://www.jianshu.com/p/457fb0356a09
export this_log=$1
line_last=1
i=1
while :
do
	line_num=`cat $this_log|wc -l`
	this_str=`sed -n ''${line_last}','${line_num}'{/running mode/Ip}' $this_log`
	if [[ $this_str =~ "RUNNING mode" ]];then
		echo $this_str
		echo "running successfully!"
		break
	else
		echo "waiting......."
		sed -n ''${line_last}','${line_num}'{/error/Ip}' $this_log
		this_temp_erro=`tail -10 $this_log|grep -i "error"`
		if [[ $this_temp_erro ]];then
			((++i))
			echo $i
		else
			i=1		
		fi
		if (( $i > 30 ));then
			echo "maybe something wrong! please check the log!"
			echo "log ---> $this_log"
			exit 1
		fi
	fi
	line_last=`expr ${line_num} + 1`
	echo $line_last
sleep 2
done	
