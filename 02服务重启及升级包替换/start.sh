#!/bin/bash
#email gqoyvf@163.com
#date 2019-7-3
export LANG="en_US.UTF-8"
echo "
1 restart uap_domain

2 restart pms_domain

"
cd ./function/start_weblogic/
read -p "input here------>" op
case $op in 
	1)	
		. ./call_start.sh 17001 /home/weblogic/bea/user_projects/domains/uap_domain
		;;
		
	2)
                . ./call_start.sh 80 /home/weblogic/bea/user_projects/domains/pms_domain
                ;;

	*)
		echo "maybe something wrong............."
		;;
esac
