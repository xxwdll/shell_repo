#!/bin/bash
this_ip=$1
ftp -n<<EOF
open $this_ip
user root itssoft
binary
prompt off
cd /home
mput temp.sh
close
bye
EOF
