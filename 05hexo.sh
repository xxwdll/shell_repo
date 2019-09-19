#!/bin/bash
mkdir -p /home/soft && cd /home/soft
wget https://cdn.npm.taobao.org/dist/node/v10.16.3/node-v10.16.3-linux-x64.tar.xz
chmod +x node-v10.16.3-linux-x64.tar.xz
xz -d node-v10.16.3-linux-x64.tar.xz
cp ./node-v10.16.3-linux-x64.tar /opt/
cd /opt/ && tar -xvf node-v10.16.3-linux-x64.tar
ln -s /opt/node-v10.16.3-linux-x64/bin/npm /usr/local/bin/
ln -s /opt/node-v10.16.3-linux-x64/bin/node /usr/local/bin/
npm install -g hexo-cli hexo-renderer-jade hexo-renderer-stylus
ln -s /opt/node-v10.16.3-linux-x64/lib/node_modules/hexo-cli/bin/hexo /usr/local/bin/
mkdir /usr/blog && cd /usr
hexo init blog
firewall-cmd --add-port=4000/tcp --permanent
firewall-cmd --reload
