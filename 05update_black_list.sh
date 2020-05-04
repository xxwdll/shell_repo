#!/bin/bash
# 写入到定时任务中，日志为/home/attack.log
*/2 * * * * bash /var/log/count.sh>>/home/attack.log
# 每小时检查一次，ssh 登录失败大于3次，将该ip 加入黑名单
cd /var/log
last_hour=`date +'%b %_d %0k' --date='-1 hour'`
this_day=`date +'%b %_d'`
cat secure|egrep "$last_hour|$this_day"|egrep "Failed password|Did not receive identification"| grep -oP '([0-9]{1,3}\.){3}[0-9]{1,3}' > wrongIP.txt
cat wrongIP.txt | sort | uniq -c | sort -rn -k 1 > countWrongIP.txt
cat countWrongIP.txt | while read li
do
  this_time=`echo $li | awk '{print $1}'`
  if [[ $this_time -gt 3 ]];then
    this_ip=`echo $li | awk '{print $2}'`
    deny_ip="sshd:"$this_ip
    this_result=`cat /etc/hosts.deny | grep "$this_ip"`
    if [  -z "$this_result" ];then
      echo "`date` 新增黑名单ip:"$this_ip
      echo $deny_ip >> /etc/hosts.deny
      sum_black=`cat /etc/hosts.deny | grep sshd: | grep -v etc | wc -l`
      echo '当前黑名单数量:'$sum_black
      echo '--------------------------------------------------------------------------------------------------------'
    fi
  else
    break
  fi
done
rm -f wrongIP.txt countWrongIP.txt 
