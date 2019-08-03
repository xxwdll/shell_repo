#!/bin/bash
#email gqoyvf@163.com
#date 2019-7-18
export LANG="en_US.UTF-8"
echo "
	1 upgrade jar files
	
	2 rollback jar files

	3 custom 
		
"

cd ./function/replace_jar
read -p "input here------>" op
case $op in 
	1)	
		. ./replace_jar.sh /home/src_dir /home/tar_dir
		;;
		
	2)
                . ./rollback_jar.sh 
                ;;

	3)	
		read -p "input the target address:" tar_dir
		. ./replace_jar.sh /home/src_dir $tar_dir
		;;

	*)
		echo "maybe something wrong............."
		;;
esac
