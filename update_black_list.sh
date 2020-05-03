#!/bin/bash
# 写入到定时任务中，日志为/home/attack.log
# 05 */1 * * * bash /var/log/count.sh>>/home/attack.log
# 每小时检查一次，登录失败大于3次，将该ip 加入黑名单
cd /var/log
last_hour=`date +'%b %d %k' --date='-1 hour'`
echo "检查时间:"`date --date='-1 hour'`
cat secure|grep "$last_hour"|egrep "Failed password for|Did not receive identification"| grep -oP '([0-9]{1,3}\.){3}[0-9]{1,3}' > wrongIP.txt
cat wrongIP.txt | sort | uniq -c | sort -rn -k 1 > countWrongIP.txt
cat countWrongIP.txt | while read li
do
  this_time=`echo $li | awk '{print $1}'`
  if [[ $this_time -gt 3 ]];then
    this_ip=`echo $li | awk '{print $2}'`
    echo '攻击次数:' $this_time '攻击所用ip:' $this_ip
    #echo "$li"
    deny_ip="sshd:"$this_ip
    #echo $deny_ip
    this_result=`cat /etc/hosts.deny | grep "$this_ip"`
    if [  -z "$this_result" ];then
      echo $deny_ip
      echo $deny_ip >> /etc/hosts.deny
    fi
  else
    break
  fi
done
sum_black=`cat /etc/hosts.deny | grep sshd: | grep -v etc | wc -l`
echo
echo '当前黑名单数量:'$sum_black

rm -f wrongIP.txt countWrongIP.txt 
#service sshd restart
echo '--------------------------------------------------------------------------------------------------------'
echo '--------------------------------------------------------------------------------------------------------'
