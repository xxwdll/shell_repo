#!/bin/bash
#email gqoyvf@163.com
#date 2019-7-19
export LANG="en_US.UTF-8"
echo "choose date:"
tail -4 ./upgrade_log/upgrade.log | awk '{print NR" "$1" "$2 "--->" $4}'
read -p "input here------>" op
case $op in 
	1)
		export src_addr=`tail -4 upgrade_log/upgrade.log | awk '{print $3}'|sed -n '1p'`
		export tar_addr=`tail -4 upgrade_log/upgrade.log | awk '{print $4}'|sed -n '1p'`	
		. ./replace_bakjar.sh $src_addr $tar_addr
		export pattern=`echo $src_addr|tr -cd "[0-9]"`
		sed -i "/$pattern/d" upgrade_log/upgrade.log
		rm -rf $src_addr
		;;
		
	2)
		export src_addr=`tail -4 upgrade_log/upgrade.log | awk '{print $3}'|sed -n '2p'`
		export tar_addr=`tail -4 upgrade_log/upgrade.log | awk '{print $4}'|sed -n '2p'`
                . ./replace_bakjar.sh $src_addr $tar_addr
		export pattern=`echo $src_addr|tr -cd "[0-9]"`
                sed -i "/$pattern/d" upgrade_log/upgrade.log
                rm -rf $src_addr
		;;
	3)
		export src_addr=`tail -4 upgrade_log/upgrade.log | awk '{print $3}'|sed -n '3p'`
		export tar_addr=`tail -4 upgrade_log/upgrade.log | awk '{print $4}'|sed -n '3p'`
		. ./replace_bakjar.sh $src_addr $tar_addr
		export pattern=`echo $src_addr|tr -cd "[0-9]"`
                sed -i "/$pattern/d" upgrade_log/upgrade.log
                rm -rf $src_addr
		;;
	4)
		export src_addr=`tail -4 upgrade_log/upgrade.log | awk '{print $3}'|sed -n '4p'`
		export tar_addr=`tail -4 upgrade_log/upgrade.log | awk '{print $4}'|sed -n '4p'`
		. ./replace_bakjar.sh $src_addr $tar_addr
		export pattern=`echo $src_addr|tr -cd "[0-9]"`
		sed -i "/$pattern/d" upgrade_log/upgrade.log
                rm -rf $src_addr
		;;
	*)
		echo "maybe something wrong............."
		;;
esac
