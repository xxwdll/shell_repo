#!/bin/bash 
# chkconfig: 2345 10 90 
# description: start oracle
su - oracle <<EON 
export ORACLE_SID=ZBODS
lsnrctl start  
sqlplus /nolog <<EOF 
conn / as sysdba  
startup  
exit  
EOF 
export ORACLE_SID=ods
lsnrctl start  
sqlplus /nolog <<EOF 
conn / as sysdba  
startup  
exit  
EOF    
exit
EON
