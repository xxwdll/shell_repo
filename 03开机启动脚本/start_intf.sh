#!bin/bash
# chkconfig: 2345 10 90 
# description: start intf
export pid=` ps -ef | grep java |grep appuap_8001|grep -v grep|awk '{ print $2 }'`
if [ -z $pid ];then
        echo "the process is not running"
else
        kill -9 $pid
        echo "kill the session "$pid
fi
sleep  2
cd /home/weblogic/bea/user_projects/domains/app_uap_domain/servers/appuap_8001
rm -rf cache/ data/ logs/ tmp/
cd /home/weblogic/bea/user_projects/domains/app_uap_domain/bin
rm -rf appuap_85.log
rm -rf nohup.out
#xhost +
nohup /home/weblogic/bea/user_projects/domains/app_uap_domain/bin/startWebLogic.sh >appuap_85.log &
sleep 2
echo "INTFUAP服务重启中，完成后将重启INTF服务，请等待！"
sleep 250
echo "INTF服务重启中！"

export pid=` ps -ef | grep java |grep app_8002|grep -v grep|awk '{ print $2 }'`
if [ -z $pid ];then
        echo "the process is not running"
else
        kill -9 $pid
        echo "kill the session "$pid
fi
sleep  2
cd /home/weblogic/bea/user_projects/domains/app_domain/servers/app_8002
rm -rf cache/ data/ logs/ tmp/
cd /home/weblogic/bea/user_projects/domains/app_domain/bin
rm -rf app_85.log
rm -rf nohup.out
#xhost +
nohup /home/weblogic/bea/user_projects/domains/app_domain/bin/startWebLogic.sh >app_85.log &
sleep 2
#tail -400f app_85.log
