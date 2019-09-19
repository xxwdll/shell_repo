#!/bin/bash
kill -9 `pidof hexo`
cd /usr/blog
hexo clean
hexo g
hexo d
rm -f nohup.out hexo_server.log
nohup hexo s > hexo_server.log &
sleep 2
