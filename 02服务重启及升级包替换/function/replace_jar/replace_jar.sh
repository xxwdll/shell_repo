#!/bin/bash
#emial gqoyvf@163.com
#date 2019/07/18
export src_addr=$1
export tar_addr=$2
export this_date=`date +%Y%m%d%H%m%s`
mkdir -p `pwd`/bak_jar/${this_date}
export bak_addr=`pwd`/bak_jar/${this_date}
if [ ! -d "${src_addr}" ] || [ ! -d "${tar_addr}" ];then
	echo "maybe something wrong............."
	exit 1
fi

echo "list source files:"
ls -lt $src_addr
read -p 'please enter "y" to confirm :' choose
if [[ $choose="Y" ]];then
i=1
echo "upload source jar files......"
for jarfile in `ls ${src_addr}`;
do
         B[$i]=${jarfile%_*};
        ((i++));
done

#rm -rf ${bak_path}/*

echo  "deleting target jar files......"
for jarf  in ${B[*]}
do
        echo "bak file $jarf"
        cp ${tar_addr}/$jarf?1*.jar ${bak_addr}
        echo "del file $jarf"
        rm -rf ${tar_addr}/$jarf?1*.jar
        echo "upload  file $jarf"
        cp ${src_addr}/$jarf?1*.jar ${tar_addr}
	rm -rf ${src_addr}/$jarf?1*.jar
done
echo "replace files successfully"
fi
echo `date +"%Y-%m-%d %H:%M:%S"` "$bak_addr $tar_addr" >> ./upgrade_log/upgrade.log
if [[ `cat ./upgrade_log/upgrade.log | wc -l` > 4 ]];then
        . ./redundancy.sh
fi 
