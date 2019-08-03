#!/bin/bash
#email gqoyvf@163.com
#date 2019-7-11
export LANG="en_US.UTF-8"
export s_addr=$1
echo "server address is $s_addr,ready to restart ?"
read -p 'please enter "y" to confirm :' choose
choose=`echo $choose| tr '[a-z]' '[A-Z]'`
if [[ $choose="Y" ]];then
cd $s_addr/servers
rm -rf `find ./ -type d -name "cache"`
rm -rf `find ./ -type d -name "data"`
rm -rf `find ./ -type d -name "logs"`
rm -rf `find ./ -type d -name "tmp"`
sleep  2
cd $s_addr/
rm -rf `find $s_addr -name "*.lok"`
sleep  2
echo "restarting .................................."
cd $s_addr/bin
# rm -rf ./*nohup.out
sleep  2
export this_date=`date +%Y%m%d_%H%M`
nohup ./startWebLogic.sh > ${this_date}_nohup.out &
sleep  2
tail -400f ./${this_date}_nohup.out
fi

