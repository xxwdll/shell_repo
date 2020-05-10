#!/bin/bash
this_script=$1
if [ ! -z "$this_script" ];then
  cat $this_script > temp.sh
fi
cat ./ip/0*.txt | while read li;
do
  this_ip=`echo $li | awk '{print $5}'`
  this_name=`echo $li | awk '{print $NF}'`
  lane_name=`echo $li | awk '{print $3}'`
  echo -e "\n\n"$this_name $lane_name $this_ip"..."
  #bash ./ip/ftp.sh $this_ip
  ftp_result=$(bash ./ip/ftp.sh $this_ip)
  [ "$ftp_result" != "Interactive mode off." ] && echo -e "\033[31m ftp wrong! $this_name $lane_name $this_ip \033[0m" && continue
  expect ./ip/check.exp $this_ip "cd /home;bash temp.sh;rm -f temp.sh"  | sed -n '/bash temp.sh/,$p'| egrep -a -v 'exit\s|root@|logout|Connection closed'
done
