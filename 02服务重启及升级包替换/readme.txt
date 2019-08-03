1start.sh
用来重启weblogic服务
. ./call_start.sh 服务的端口号 服务的地址（含有bin目录）
2upgrade.sh
用来替换旧的jar包
并具有回退功能，保留4次执行记录
. ./replace_jar.sh 新jar包的存放目录 旧jar包的存放目录