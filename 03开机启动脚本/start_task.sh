#!/bin/bash
# chkconfig: 2345 10 90 
# description: start task
export pid=` ps -ef | grep java |grep taskuap_8003|grep -v grep|awk '{ print $2 }'`
if [ -z $pid ];then
        echo "the process is not running"
else
        kill -9 $pid
        echo "kill the session "$pid
fi
sleep  2
cd /home/weblogic/bea/user_projects/domains/task_uap_domain/servers/taskuap_8003
rm -rf cache/ data/ logs/ tmp/
cd /home/weblogic/bea/user_projects/domains/task_uap_domain/bin
rm -rf nohup.out
rm -rf taskuap_85.log
#xhost +
nohup /home/weblogic/bea/user_projects/domains/task_uap_domain/bin/startWebLogic.sh >taskuap_85.log &
sleep 2
echo "TASKUAP服务重启中，完成后将重启TASK服务，请等待！"
sleep 250
echo "TASK服务重启中！"

export pid=` ps -ef | grep java |grep task_8004|grep -v grep|awk '{ print $2 }'`
if [ -z $pid ];then
        echo "the process is not running"
else
        kill -9 $pid
        echo "kill the session "$pid
fi
sleep  2
cd /home/weblogic/bea/user_projects/domains/task_domain/servers/task_8004
rm -rf cache/ data/ logs/ tmp/
cd /home/weblogic/bea/user_projects/domains/task_domain/bin
rm -rf nohup.out
rm -rf task_85.log
#xhost +
nohup /home/weblogic/bea/user_projects/domains/task_domain/bin/startWebLogic.sh >task_85.log &
sleep 2
#tail -400f task_85.log
